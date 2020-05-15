BoxGraph box1; //declare a box graph //<>//
float scale=.5;
float xmin = 0;
float xmax = 13;
float xnumbox = 6.5;
float ymin = -1.5;
float ymax = 1.5;
float ynumbox = 4;
float col;
int fsize = 36;


color red = #ff0000;
color blue = #0000ff;


void setup(){
  size(1800,1000);
  box1 = new BoxGraph(scale,xmin,xmax,xnumbox,ymin,ymax,ynumbox,"Tahoma",fsize);
  background(255);
  box1.theBox();
  for(int i=0;i<100;i++){  //generate 100 pts //<>//
    float x = i*(4*PI/100);
    float y = sin(x);
    box1.plotxy(x,y,blue);
    
  } //end for
} //end setup

void draw(){
    
  
  } //end draw
  
  
