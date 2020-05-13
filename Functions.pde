void pt(float x,float y,float size,color col){
  int fillColor = g.fillColor; //save current
  int strokeColor = g.strokeColor; //save current
  fill(col);
  stroke(col);
  circle(x,y,size);
  fill(fillColor); //restore fill color
  stroke(strokeColor); //restore stroke color
}
