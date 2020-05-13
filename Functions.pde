
void pt(float x,float y,float size,color col){
  int fillColor = g.fillColor; //save current
  int strokeColor = g.strokeColor; //save current
  fill(col);
  stroke(col);
  circle(x,y,size);
  fill(fillColor); //restore fill color
  stroke(strokeColor); //restore stroke color
}

//function to determine the maximum number length when it is a string
  //nmin = xmin or ymin
  //nmax = xmax or ymax
  //numbox = xnumbox or ynumbox
  int numlen(float nmin,float nmax,float numbox){
    int nlen = str(nmin).length();
    int mlen = str(nmin + floor(numbox+1)*(nmax-nmin)/numbox).length();
    nlen = max(nlen,mlen);
    if((nmax-nmin)%numbox==0 && nlen>2){nlen = nlen -2;}
    return nlen;
  }
