Twitter-esque microblog app created using Elixir, PostgreSQL, Phoenix Framework, Javascript, and Bootstrap.

Notes

Logout:
- takes you to post index
- not being logged in doesn't show the edit or new buttons for post
- an alert appears at the top when you log out
- the login bar and button appears when you are logged out

Post:
- the new and edit buttons for post can only be seen if you are logged in
- the show of the post displays the user who posted and their handle

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
