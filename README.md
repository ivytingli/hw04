Github link: https://github.com/ivytingli/hw04
Website link: microblog.ivyli.site

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

Deploy script:
I was not able to successfully deploy through running the script. 
It generated some files and resulted in some compilation errors.
I ran it with the argument as . (current directory)
What I have now was taken from the deploy.sh from Nat Tuck's version on github.