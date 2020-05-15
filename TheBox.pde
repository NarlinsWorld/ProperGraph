class BoxGraph {
  /* default variable values will be initialized and should be overridden by a caller. */
  PFont font;
  float scale=.7;
  float xmin = 0;
  float xmax = 1;
  float xnumbox = 10;
  float ymin = 0;
  float ymax = 1;
  float ynumbox = 10;
  int fsize = 16;
  color col = #000000;

  int topCornerX;
  int topCornerY;
  PVector lowerLeft;
  PVector rt; //lower right corner
  float boxwidth;
  float boxheight;
  PVector v; //a temporary vector
  PVector zz; //the screen pixels for zero.x zero.y even if not on screen.
  color red = #ff0000;
  PVector Middle; //Center of the Processing Window Does not move
  float m;
  
  //constructor
  BoxGraph(float tscale,float tXmin, float tXmax, float txbox, float tYmin, float tYmax, float tybox, String tFont, int tfsize) {
  scale = tscale;
  xmin = tXmin;
  xmax = tXmax;
  xnumbox = txbox;
  ymin = tYmin;
  ymax = tYmax;
  ynumbox = tybox;
  fsize = tfsize;
  
  font = createFont(tFont,36, true); //36 point, anti-aliasing on
  textFont(font,fsize); //specify font & size for the next text command
  Middle = new PVector(width/2,height/2);
  topCornerX=round(Middle.x - scale*width/2);
  topCornerY=round(Middle.y- scale*height/2);
  lowerLeft = new PVector(topCornerX,height*scale+topCornerY); //lower left corner
  rt = new PVector(lowerLeft.x+scale*width,lowerLeft.y); //lowr right corner
  boxwidth = rt.x-lowerLeft.x;
  boxheight = lowerLeft.y - topCornerY;
  
  zz = new PVector();
  m=(rt.x-lowerLeft.x)/(xmax-xmin);
  zz.x = lowerLeft.x + m*(0-xmin);
  m=(topCornerY-lowerLeft.y)/(ymax-ymin);
  zz.y = lowerLeft.y + m*(0-ymin);
  pt(lowerLeft.x+zz.x,lowerLeft.y+zz.y,10,red);
  println(zz.x,"  ",zz.y);
  v = new PVector();
  } //end constructor
  
  void theBox(){
    
  noFill();
  stroke(#000000);
  strokeWeight(3);
  rect(topCornerX,topCornerY,boxwidth,boxheight); //draws the rectangle
  fill(#000000); //fill for tic marks
  
  //draw the x-axis tic marks
  //determine the maximum xnumber length in characters
     int xnlen = numlen(xmin,xmax,xnumbox);
     m=(rt.x-lowerLeft.x)/xnumbox;  
  for(int i=0; i<floor(xnumbox+1); i++){
    float tix=lowerLeft.x+m*i;
    line(tix,lowerLeft.y,tix,lowerLeft.y-25*scale);
    fill(#000000); //textcolor
    //if the numbers all have zero decimals, then omit the decimal
    String xnumber = str(xmin+i*(xmax-xmin)/xnumbox);
    if((xmax-xmin)%xnumbox==0){ //this is the number thats printed
       xnumber = xnumber.substring(0, xnumber.length() - 2);}        
    text(xnumber,tix-xnlen*.005*width,lowerLeft.y+.04*height);
  } //end for
  
  //draw the y-axis tic marks
  //determine the maximum ynumber length
     int nlen = numlen(ymin,ymax,ynumbox);
  m = (topCornerY-lowerLeft.y)/ynumbox;
  for(int i=0; i<ynumbox+1; i++){
     float tix = lowerLeft.y+m*i;
     line(lowerLeft.x,tix,lowerLeft.x+25*scale,tix);
     //if the numbers all have zero decimals, then omit the decimal
     String ynumber = str(ymin+i*(ymax-ymin)/ynumbox);
     if((ymax-ymin)%ynumbox==0){ //this is the number thats printed
       ynumber = ynumber.substring(0, ynumber.length()-2);}
     text(ynumber,lowerLeft.x-.0125*nlen*width,tix+.012*height);
  } //end for
  } //end function
  
  void plotxy(float x,float y, color col){
    m=(rt.x-lowerLeft.x)/(xmax-xmin);
    x=zz.x + m*x  ;
    m=(topCornerY-lowerLeft.y)/(ymax-ymin);    
    y = zz.y+m*y;
    pt(x,y,1,col);
  }// end plotxy
  
} //end class
