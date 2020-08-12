# Development Log

## Days 1 - 3 (10-13/11/19)
The App has 3 main features including
1. Ip Scanner
2. Port Scanner
3. MAC Changer

The first step in the process was to check if I could get a proof of concept going, which took a
a few nights, but I managed to get them working in three different files.

## Day 4 (14/11/19)
Today Im getting the menu working with the individual components. 
This was done successfully using require './<filename>'
However in order to get this working I had to use classes but not in the normal way. 
EDIT: Later found out that I didn't need to needlessly use class to use require. Still works, but the portscanner has somehow broken, and none of the previous code seems to work so Im going to have to rewrite that.

## Day 6 (16/11/2019)
Linked all the aspects of the menus and sub-menus of the app together, still needs a couple of things like printing results into an output table. 
Doing Development Plan today.

## Day 10 (20/11/2019)
Portscanner fixed, was really just a networking issue, added "enter for localhost" to correct for IP differences. 
So far unable to adapt the gem tty-prompt to my menu. 
Able to write the menu but I am unable to run the different features via require. 
### Edit
Added colour & to menus and added gem tty-prompt.
Reworked the menus so that they are easier to select using tty-prompt.
Fixed up styling so that the project is easier to read.


