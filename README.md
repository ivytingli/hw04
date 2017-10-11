Login: 
- takes you to post index
- login bar disappears and a logout button appears
- an alert appears at the top when you log in
- trying to log in with an invalid email will alert you with a red bar saying there's no such user
- 

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

            <%= inputs_for f, :users, fn i -> %>
           <%= if @follows.action do %>
           <div class="alert alert-danger">
             <p>Oops, something went wrong! Please check the errors below.</p>
           </div>
           <% end %>
           <div class="form-group">
             <%= hidden_input f, :followed_user, class: "form-control", value: @current_user.id %>
             <%= error_tag f, :followed_user %>
           </div>
           <div class="form-group">
             <%= hidden_input f, :follower, class: "form-control", value: @user.id %>
             <%= error_tag f, :follower %>
           </div>
           <div class="form-group">
             <%= submit "Follow", class: "btn btn-primary" %>
           </div>
  </div>
<% end %>

<%= form_for @changeset, @action, fn f -> %>
  <%= if @changeset.action do %>

    <div class="alert alert-danger">
      <p>Oops, something went wrong! Please check the errors below.</p>
    </div>
  <% end %>

<div class="form-group">
              <%= hidden_input f, :followed_user, class: "form-control", value: @current_user.id %>
              <%= error_tag f, :followed_user %>
            </div>
            <div class="form-group">
              <%= hidden_input f, :follower, class: "form-control", value: @current_user.id %>
              <%= error_tag f, :follower %>
            </div>

  <div class="form-group">
    <%= submit "Submit", class: "btn btn-primary" %>
  </div>
<% end %>


I GIVE UP