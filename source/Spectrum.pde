PImage mazeMap, cake;
PImage map;
void setup(){
  size(900,900,P2D);
  background(0);
  frameRate(60);
  cake = loadImage("data/images/cake.jpeg");
  mazeMap = loadImage("data/images/200by200orthogonalmaze.png");
  mazeMap.resize(height*15,0);
  mazeMap.filter(INVERT);
  //mazeMap.filter(BLUR,4);
  mazeMap.filter(THRESHOLD);
  map = mazeMap;
  p = new Player(map.width/2-width/2-50, -height/2+50);
}
float angle;
int xPos = 0;
int yPos = 0;
float lightDensity = 150;
float pulseFrequency = 20;
int wl = 380;
void draw(){
  p.playerMove();
  p.updateMovement();
  p.updateRealPosition();
  spawnLight();
  for(Light a: L){
    a.updateMovement();
  }
  for(int i = L.size()-1; i > 0; i--){
    Light a = L.get(i);
    if(a.delete()){
      L.remove(i);
    }
  }
  
  background(0);
  pushMatrix();
  p.translateMove();
  //drawMap();
  drawText();
  for(Light a: L){
    a.show();
    a.showReflected();
  }
  //fill(255);
  //llipse(p.xRPos, p.yRPos, 10, 10);
  popMatrix();
  showText();
}
void mouseWheel(MouseEvent event){
  //if(wl >= 380 && wl <= 750){
    wl += 5*event.getCount();
  //} else {
  //  wl += 25*event.getCount();
  //}
  if(wl < -3000)
    wl = -3000;
  if(wl > 4999)
    wl = 4999;
}
void keyPressed(){
  p.setMove(keyCode, true);
}
void keyReleased(){
  p.setMove(keyCode, false);
}
