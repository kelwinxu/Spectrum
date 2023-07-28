ArrayList<Enemy> E = new ArrayList<Enemy>();

color infrated = #FF880015;
class Enemy{
  int x, y, speed, size;
  Enemy(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  void show(){
    stroke(infrated);
    fill(infrated);
    ellipse(x, y, 2*size, 2*size);
  }
  void checkForLight(Light a){
    if(dist(a.x, a.y, x, y) < size && !a.reflected && a.wlId == 7){
      a.reflected = true;
      a.vy *= -1;
      a.vx *= -1;
      a.fluorescence = 20;
      a.timeSpan = 2*a.timePassed;
    }
  }
  void checkForPlayer(){
    if(interference < map(dist(p.xRPos, p.yRPos, x, y) - size, 0, 300, 20, 0)){
      interference = map(dist(p.xRPos, p.yRPos, x, y) - size, 0, 300, 20, 0);
    }
    if(interference > 20)
      interference = 20;
  }
}
