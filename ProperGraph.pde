//plan is to make this a class
float scale=0.9;
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
  size(800,800);
  topCornerX=round((1-scale)*width-10);
  topCornerY=round((1-scale)*height/3);
  zeroZero = new PVector(topCornerX,height*scale+topCornerY);
  rt = new PVector(zeroZero.x+scale*width,zeroZero.y);
  v = new PVector();
}

void draw(){
  background(255);
  noFill();
  stroke(#000000);
  strokeWeight(3);
  rect(topCornerX,topCornerY,scale*height,scale*height);
  
  //draw the x-axis tic marks
  float  m=(rt.x-zeroZero.x)/xnumbox;
  for(int i=0; i<xnumbox+1; i++){
    float tix=zeroZero.x+m*i;
    line(tix,zeroZero.y,tix,zeroZero.y-20);
  } //end for
  
  //draw the y-axis tic marks
  m = (topCornerY-zeroZero.y)/ynumbox;
  for(int i=0; i<ynumbox+1; i++){
     float tix = zeroZero.y+m*i;
     println(tix," ",i);
     line(zeroZero.x,tix,zeroZero.x+20,tix);
  } //end for  
  } //end draw

  
  
  
   //<>//
  
