Github link: https://github.com/ivytingli/hw04
Website link: microblog.ivyli.site

<<<<<<< HEAD
Logout:
- takes you to post index
- not being logged in doesn't show the edit or new buttons for post
- an alert appears at the top when you log out
- the login bar and button appears when you are logged out

Post:
- the new and edit buttons for post can only be seen if you are logged in
- the show of the post displays the user who posted and their handle

Follows:
- I was not able to get to implement follows in time

I was trying to get follows to work with the form_for below instead of the button, but I couldn't get it to recognize @follows as a changeset. 
I also tried @follow, but it didn't work.
I think I may have been missing something and I'm not sure what it was. 
I couldn't leave my comments in the file because it wouldn't compile if I did, so I put my code snippet here.

            #<%= form_for @follows, follow_path(@conn, :create), fn f -> %>
            #<%= if @follows.action do %>
            #<div class="alert alert-danger">
            #  <p>Oops, something went wrong! Please check the errors below.</p>
            #</div>
            #<% end %>
            #<div class="form-group">
            #  <%= hidden_input f, :followed_user, class: "form-control", value: @current_user.id %>
            #  <%= error_tag f, :followed_user %>
            #</div>
            #<div class="form-group">
            #  <%= hidden_input f, :follower, class: "form-control", value: @user.id %>
            #  <%= error_tag f, :follower %>
            #</div>
            #<div class="form-group">
            #  <%= submit "Follow", class: "btn btn-primary" %>
            #</div>
            #<% end %>
=======
Likes:
- likes button only shows if you are logged in as a user
- like/unlike button toggle based on whether or not you have already liked a post
- likes can be viewed below the show page of a post
- you can see who liked the post
- unlike and like is controlled by AJAX commands for POST and DELETE
- you can only like if you are not currently liking the post 
- if you liked a post you should no longer be able to like it again and an "Unlike" button appears in its place
- the user who posted can also like their own message (like Facebook)
- pressing the unlike button removes whoever the user is logged in as from the likes
- when you like a post a card displays with the "{{user handle}} liked this post"

I got some help from Ryan Hughes on the implementation of likes, specifically the mapping of the like data.
I implemented counting likes through both elixir and through javascript.
The elixir one only updates when the page is refreshed.
The javascript one updates without page refresh (it is the one shown as a header).
>>>>>>> 013a8dfb28fe5fa68811dbd757a9ce5bd5d8891d

Deploy script:
I was not able to successfully deploy through running the script. 
It generated some files and resulted in some compilation errors.
I ran it with the argument as . (current directory)
What I have now was taken from the deploy.sh from Nat Tuck's version on github.