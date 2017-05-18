# StorytelBridgeTestTask
Unicodecoders test task

Your mission is to create a new iOS (swift) app from scratch. The app should
contain one screen only that displays a list of books and some metadata for the
list itself.
To get the data your app should use this dummy api:
http://api.storytelbridge.com/consumables/list/1.

In the JSON of the api provided on the
previous slide there is a field in the root
object called “metadata”. This one should
be used to fill the “list-metadata-area”. For
this exercise we only want the “cover” as
a background image and the “title” (see
wireframe to the left)
In the root of the json there’s also an
array “consumables” containing the books
that should be displayed. Each
“consumable” has two children “metadata”
and “userspecific”. You only need to
consider metadata and specifically the
“cover”, “title”, “authors” and “narrators”.
All of this info should be displayed
according to the wireframe.

Each book-cell should contain a book cover, a title, and two more labels.
One containing the list of author names, prepended with “By: “ and comma
separated. It should only use one row and truncate when the string becomes
too long.
The last label should contain the list of narrator names, prepended with “With: ” and also comma separated (if there are multiple). This label should
also only use one row and truncate at the end if the string becomes too long.

When scrolling down, the
list-metadata-area should just
disappear with the rest of the page.
Also, when reaching the bottom of
the list. A new request should be
sent to load more books to the
current list. You should do that by
appending a query parameter
“?page=xxx” where “xxx” will be
given to you in the api response (see
root of json, look for the field called
“nextPage”), so if “nextPage” = 3, the
request you send should be towards
http://api.storytelbridge.com/consum
ables/list/1?page=3
While the request is loading you
should show a spinner just below the
last list cell.
When the reponse arrives, you
should append the list of books to the
list you already loaded.

What to consider
- Write clean, readable and testable code. Also write unit tests where it
makes sense.
- Use autolayout
- The exercise is not about UI design, which is why there aren’t any
details on colour codes, fonts, margins etc. Just position the elements
roughly from what you can see in the wireframes.
-
- Take the opportunity to showcase your coding style and use whatever
design pattern (MVC, MVVM, MVP) you would normally have used for
this kind of task. Also use whatever network library, dependency
management, etc that you prefer (if any)...
To send in your solution you should create a zip file containing the
project and send that in an email to ausrine@devv.it
