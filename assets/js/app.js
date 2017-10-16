// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

let handlebars = require("handlebars");

$(function() {
  if (!$("#likes-template").length > 0) {
    // Wrong page.
    return;
  }

  let tt = $($("#likes-template")[0]);
  let code = tt.html();
  let tmpl = handlebars.compile(code);

  let dd = $($("#post-likes")[0]);
  let path = dd.data('path');
  let p_id = dd.data('post-id');

  let bb = $($("#like-button")[0]);
  let u_id = bb.data('user-id');

  let likeData = []
  let likeMap = {}

  function fetch_likes() {
    function got_likes(data) {
      console.log(data);
      likeData = data;
      likeMap = {};

      // sets the user_id to be the key to the data in api
      for (var i = 0; i < data.data.length; i++) {
        likeMap[data.data[i].user_id] = data.data[i]
      }

      // sets the data array to the values of the data in api
      data.data = Object.values(likeMap)

      // checks if like or unlike button should show
      if(likeMap[u_id]){
        $("#unlike-button").show()
        $("#like-button").hide()
      }
      else {
        $("#unlike-button").hide()
        $("#like-button").show()
      }

      $("#likes-count-js").html(data.data.length)

      let html = tmpl(data);
      dd.html(html);
    }

    $.ajax({
      url: path,
      data: {post_id: p_id},
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: got_likes,
    });
  }

  function add_like() {

    let data = {like: {post_id: p_id, user_id: u_id}};

    $.ajax({
      url: path,
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "json",
      method: "POST",
      success: fetch_likes,
    });

  }

  function delete_like() {

    $.ajax({
      url: path + "/" + likeMap[u_id].id,
      contentType: "application/json",
      dataType: "json",
      method: "DELETE",
      success: fetch_likes,
    });
}

  bb.click(add_like);
  $("#unlike-button").click(delete_like);

  fetch_likes();
});
