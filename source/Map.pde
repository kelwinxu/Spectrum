void drawMap(){
  image(map,0,0);
}
void loadMap(){
  cake = loadImage("data/images/cake.jpeg");
  map1 = loadImage("data/images/map1.png");
  map1.resize(height*3,0);
  mazeMap = loadImage("data/images/maze.jpeg");
  mazeMap.resize(height*15,0);
  mazeMap.filter(INVERT);
  //mazeMap.filter(BLUR,4);
  mazeMap.filter(THRESHOLD);
  paint = loadImage("data/images/paint color test.png");
}
