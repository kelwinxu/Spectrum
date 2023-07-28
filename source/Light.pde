ArrayList<Light> L = new ArrayList<Light>();
void spawnLight(){
  if(frameCount % pulseFrequency==0){
    for(int i = 0; i<lightDensity; i++){
      L.add(new Light(p.xRPos, p.yRPos, angle, wl));
      angle += 2*PI/lightDensity;
    }
  }
}
class Light{
  int fluorescence = 50;
  boolean reflected = false;
  int alpha = 50;
  int speed = 10;
  int timeSpan = 100;
  int timePassed = 0;
  //xpos, ypos, wavelength, roundWavelength
  int wl, wlId;
  float angle, vx, vy, x, y;
  color c, rc;
  Light(float x, float y, float a ,int wl){
    this.x = x;
    this.y = y;
    this.wl = wl;
    wlId = wavelengthId(wl);
    this.angle = a;
    c = wavelenghtToRGB(wl);
    vx = cos(a)*speed;
    vy = sin(a)*speed;
    if(wl >= 750 && wl < 1100){
      rc = color(200,0,0);
    } else if(c == color(0,0,0)){
      rc = color(100);
    } else{
      rc = c;
    }
  }
  void updateMovement(){
    if(!reflected){
      x += vx+random(-5,5);
      y += vy+random(-5,5);
      reflection();
    } else {
      x += vx;
      y += vy;
    }
    timePassed++;
  }
  void showReflected(){
    if(reflected){
      fill(rc,(int((timeSpan-timePassed)*255/fluorescence)));
      noStroke();
      ellipse(x, y, 10, 10);
    }
  }
  void show(){
    fill(c,alpha);
    noStroke();
    ellipse(x, y, 10, 10); 
  }
  void reflection(){
    if(x>0 && x<map.width && y>0 && y<map.height){
      color pixel = map.pixels[int(y)*map.width+int(x)];
      if(brightness(pixel) != 0){
        color objectWl = colorToWavelengthId(pixel);
        if(objectWl == wlId ||(objectWl == 0)){
          vx *= 0.005;
          vy *= 0.005;
          timeSpan = timePassed+fluorescence;
          //vx *= -1;
          //vy *= -1;
          //timeSpan = timePassed*2;
          reflected = true;
          //c = color(255);
          alpha = 200;
        }
      }
    }
  }
  boolean delete(){
    if(timePassed > timeSpan)
      return true;
    else
      return false;
  }
}
void updateWavelenght(MouseEvent a){
  if(wl >= 380 && wl <= 750){
    wl += 5*a.getCount();
  } else {
    wl += 25*a.getCount();
  }
  switch(p.level){
    case 1:
      if(wl < -3000)
        wl = -3000;
      if(wl > 4999)
        wl = 4999;
    break;
    default:
      if(wl < -3000)
        wl = -3000;
      if(wl > 4999)
        wl = 4999;
    break;
  }
}
