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
- I was considering making the follow button a <%= link %> that would have the action of :delete for /follows


