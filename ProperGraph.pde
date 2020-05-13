//plan is to make this a class //<>//
PFont font;
float scale=.7;
float xmin = 0;
float xmax = 800;
float xnumbox = 20;
float ymin = 0;
float ymax = 20;
float ynumbox = 5;

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
  //determine the maximum xnumber length
     int xnlen = numlen(xmin,xmax,xnumbox);
  float  m=(rt.x-zeroZero.x)/xnumbox;  
  for(int i=0; i<floor(xnumbox+1); i++){
    float tix=zeroZero.x+m*i;
    line(tix,zeroZero.y,tix,zeroZero.y-20);
    fill(#000000); //textcolor
    //if the numbers all have zero decimals, then omit the decimal
    String xnumber = str(xmin+i*(xmax-xmin)/xnumbox);
    if((xmax-xmin)%xnumbox==0){ //this is the number thats printed
       xnumber = xnumber.substring(0, xnumber.length() - 2);}        
    text(xnumber,tix-xnlen*.005*width,zeroZero.y+.04*height);
  } //end for
  
  //draw the y-axis tic marks
  //determine the maximum ynumber length
     int nlen = numlen(ymin,ymax,ynumbox);
  m = (topCornerY-zeroZero.y)/ynumbox;
  for(int i=0; i<ynumbox+1; i++){
     float tix = zeroZero.y+m*i;
     line(zeroZero.x,tix,zeroZero.x+20,tix);
     //if the numbers all have zero decimals, then omit the decimal
     String ynumber = str(ymin+i*(ymax-ymin)/ynumbox);
     if((ymax-ymin)%ynumbox==0){ //this is the number thats printed
       ynumber = ynumber.substring(0, ynumber.length()-2);}
     text(ynumber,zeroZero.x-.0125*nlen*width,tix+.012*height);
  } //end for  
  } //end draw
  
  
