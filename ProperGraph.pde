//plan is to make this a class
PFont font;
float scale=0.8;
float xmin = 2.;
float xmax = 9.;
float xnumbox = 8;
float ynumbox = 8;

int topCornerX;
int topCornerY;
PVector zeroZero;
PVector rt; //lower right corner
PVector v; //a temporary vector
color red = #ff0000;
void setup(){
  size(1900,1000);
  font = createFont("Tahoma",16,true); //16 point, anti-aliasing on
  topCornerX=round((1-scale)*width-width/16);
  topCornerY=round((1-scale)*height/3);
  zeroZero = new PVector(topCornerX,height*scale+topCornerY);
  rt = new PVector(zeroZero.x+scale*width,zeroZero.y);
  v = new PVector();
}

void draw(){
  background(255);
  textFont(font,36); //specify font & size for the next text command
  noFill();
  stroke(#000000);
  strokeWeight(3);
  rect(topCornerX,topCornerY,scale*width,scale*height); //draws the rectangle
  fill(#000000); //fill for tic marks
  //draw the x-axis tic marks
  float  m=(rt.x-zeroZero.x)/xnumbox;
  for(int i=0; i<xnumbox+1; i++){
    float tix=zeroZero.x+m*i;
    line(tix,zeroZero.y,tix,zeroZero.y-20);
    fill(#000000); //textcolor
    text(str(i),tix-.01*width,zeroZero.y+.05*height);
  } //end for
  
  //draw the y-axis tic marks
  m = (topCornerY-zeroZero.y)/ynumbox;
  for(int i=0; i<ynumbox+1; i++){
     float tix = zeroZero.y+m*i;
     println(tix," ",i);
     line(zeroZero.x,tix,zeroZero.x+20,tix);
  } //end for  
  } //end draw
