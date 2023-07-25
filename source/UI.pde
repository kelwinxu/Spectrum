void showText(){
  textSize(25);
  textAlign(CENTER, CENTER);
  fill(200);
  if(wl>=0 && wl<1000){
    text(wl+1 + "nm",height/2,100);
  }else if(wl>=1000 && wl<2000){
    text(wl-999 + "µm",height/2,100);
  }else if(wl>=2000 && wl<3000){
    text(wl-1999 + "mm",height/2,100);
  }else if(wl>=3000 && wl<4000){
    text(wl-2999 + "m",height/2,100);
  }else if(wl>=4000){
    text(wl-3999 + "km",height/2,100);
  }else if(wl>=-1000 && wl<0){
    text(wl+1001 + "pm",height/2,100);
  }else if(wl>=-2000 && wl<-1000){
    text(wl+2001 + "fm",height/2,100);
  }else if(wl<-2000){
    text(wl+3001 + "am",height/2,100);
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
  //text(p.xPos, 100, 10);
  //text(p.yPos, 100, 50);
  text("use wasd para mover",width/2,height-100);
  
}
