void showText(){
  textSize(30);
  textAlign(CENTER, CENTER);
  fill(200);
  if(wl>=0 && wl<1000){
    text(wl+1 + "nm",height/2,90);
  }else if(wl>=1000 && wl<2000){
    text(wl-999 + "µm",height/2,90);
  }else if(wl>=2000 && wl<3000){
    text(wl-1999 + "mm",height/2,90);
  }else if(wl>=3000 && wl<4000){
    text(wl-2999 + "m",height/2,90);
  }else if(wl>=4000){
    text(wl-3999 + "km",height/2,90);
  }else if(wl>=-1000 && wl<0){
    text(wl+1001 + "pm",height/2,90);
  }else if(wl>=-2000 && wl<-1000){
    text(wl+2001 + "fm",height/2,90);
  }else if(wl<-2000){
    text(wl+3001 + "am",height/2,90);
  }
  if(wl >= 380 && wl <= 750){
    text("<Visible Light>",height/2,50);
  }else if(wl > 750 && wl <= 1100){
    text("<Infrated>",height/2,50);
  }else if(wl > 1000 && wl <= 2010){
    text("<Radar>",height/2,50);
  }else if(wl > 2010 && wl <= 3100){
    text("<FM/TV>",height/2,50);
  }else if(wl > 3100 && wl <= 4010){
    text("<ShortWave>",height/2,50);
  }else if(wl > 4010){
    text("<AM>",height/2,50);
  }else if(wl < 380 && wl >= -900){
    text("<UltraViolet>",height/2,50);
  }else if(wl < -900 && wl >= -2009){
    text("<X-Ray>",height/2,50);
  }else if(wl < -2009){
    text("<GammaRay>",height/2,50);
  }
  
  fill(255);
  textAlign(LEFT,CENTER);
  text(frameCount, 0, 10);
  //text(p.xPos, 100, 10);
  //text(p.yPos, 100, 50);
  text("use wasd para mover",width/2,height-100);
  
}

float teta = 0.0;
float amplitude = 50.0;
float period = 500.0;
float dx; 
float[] yvalues = new float[900];

void updateWave() {
  teta += 0.1;
  period = pow(map(wl,-3000,4999,4,80),1.5);
  dx = TWO_PI / period;
  float x = teta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}
void showWave() {
  noStroke();
  fill(255);
  for (int x = 0; x < yvalues.length; x++) {
    if(x != yvalues.length-1){
      stroke(100);
      line(x, amplitude+25+yvalues[x], x+1, amplitude+20+yvalues[x+1]);
    }
  }
}
