/*
-- topCornerX,topCornerY
Everything depends on the location of the top left corner, topCornerX,topCornerY
and we would like the graph to be more or less in the middle of the Canvas.

-- scale
The scale factor determines how much of the canvas will be used by the graph rectangle = 'the box'.
A scale factor of 1 will use all of the width and height and thus show no axis numbers.
The scale would normally be used to shrink the graph toward the middle of the screen in both x & y.

-- xmin, xmax, ymin, ymax 
These should be obvious and are about the axes start and finish.

-- xnumbox, ynumbox
These values allow the user to control how many tic marks are printed and what values associate with them.
|__|__|__|
2  3  4  5  <= Here xmin=2 and xmax=5 and xnumbox=3

  |____|____|____|____|____|
 100  300  500  700  900  1100 <= Here xmin=100 xmax=1100 and xnumbox=5
 It is the number of boxes along the axis. By math it is (xmax-xmin)/(ticspan).  Using numbox, you can determine
 exactly what values will be printed.
 There are two.  xnumbox and ynumbox so that the axis can be different.
 It is OK to use fractional numbox values. So if xmin=0, xmax=12.5, we could use xnumbox=12.5
*/
