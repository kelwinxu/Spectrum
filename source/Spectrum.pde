PImage cake, paint;
PImage map, mazeMap, map1;
void setup(){
  //colorMode(HSB,360,100,100);
  size(900,900,P2D);
  background(0);
  frameRate(60);
  loadMap();
  map = paint;
  E.add(new Enemy(500,500,50));
  p = new Player(map.width/2-width/2-50, -height/2+50);
}
float angle;
int xPos = 0;
int yPos = 0;
float lightDensity = 150;
float pulseFrequency = 20;
int wl = 730;
void draw(){
  //DRAW
  background(0);
  drawMap();
  for(Enemy a: E){
    a.show();
    a.checkForPlayer();
    for(Light b: L){
      a.checkForLight(b);
    }
  }
  //CALC
  //mouseColor();
  p.playerMove();
  p.updateMovement();
  p.updateRealPosition();
  spawnLight();
  for(Light a: L){
    a.updateMovement();
  }
  for(int i = L.size()-1; i >= 0; i--){
    Light a = L.get(i);
    if(a.delete()){
      L.remove(i);
    }
  }
  
  //SCREEN
  background(0);
  pushMatrix();
  p.translateMove();
  drawMap();
  for(Enemy a: E){
    a.show();
  }
  drawText();
  for(Light a: L){
    a.show();
    a.showReflected();
  }
  
  //fill(255);
  //ellipse(p.xRPos, p.yRPos, 10, 10);
  popMatrix();
  updateWave();
  showWave();
  showText();
}
void mouseWheel(MouseEvent event){
  updateWavelenght(event);
}
void keyPressed(){
  p.setMove(keyCode, true);
}
void keyReleased(){
  p.setMove(keyCode, false);
}
