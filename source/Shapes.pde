float pp, xoff;
void prect(float x, float y, float w, float h){
  rect(x*pp+xoff, y*pp, w*pp, h*pp);
}
void pline(float x, float y, float x2, float y2){
  line(x*pp+xoff, y*pp, x2*pp+xoff, y2*pp);
}
void pellipse(float x, float y, float w, float h){
  ellipse(x*pp+xoff, y*pp, w*pp, h*pp);
}
