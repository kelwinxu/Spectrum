/* autogenerated by Processing revision 1292 on 2023-07-28 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Spectrum extends PApplet {

PImage cake, paint;
PImage map, mazeMap, map1;
public void setup(){
  //colorMode(HSB,360,100,100);
  /* size commented out by preprocessor */;
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
public void draw(){
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
public void mouseWheel(MouseEvent event){
  updateWavelenght(event);
}
public void keyPressed(){
  p.setMove(keyCode, true);
}
public void keyReleased(){
  p.setMove(keyCode, false);
}
public void mouseColor(){
  print(colorToWavelengthId(get(mouseX,mouseY)));
  println(hex(get(mouseX,mouseY)));
}
ArrayList<Enemy> E = new ArrayList<Enemy>();

int infrated = 0xFF880015;
class Enemy{
  int x, y, speed, size;
  Enemy(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  public void show(){
    stroke(infrated);
    fill(infrated);
    ellipse(x, y, 2*size, 2*size);
  }
  public void checkForLight(Light a){
    if(dist(a.x, a.y, x, y) < size && !a.reflected && a.wlId == 7){
      a.reflected = true;
      a.vy *= -1;
      a.vx *= -1;
      a.fluorescence = 20;
      a.timeSpan = 2*a.timePassed;
    }
  }
  public void checkForPlayer(){
    if(interference < map(dist(p.xRPos, p.yRPos, x, y) - size, 0, 300, 20, 0)){
      interference = map(dist(p.xRPos, p.yRPos, x, y) - size, 0, 300, 20, 0);
    }
    if(interference > 20)
      interference = 20;
  }
}
public int wavelenghtToRGB(int wavelength) {
  float r, g, b;
  if (wavelength >= 380 && wavelength < 440) {
    // Violet
    r = (-(wavelength - 440.0f) / (440.0f - 380.0f))*255.0f;
    g = 0.0f;
    b = 255.0f;
  } else if (wavelength >= 440 && wavelength < 490) {
    // Blue
    r = 0.0f;
    g = ((wavelength - 440.0f) / (490.0f - 440.0f))*255.0f;
    b = 255.0f;
  } else if (wavelength >= 490 && wavelength < 510) {
    // Cyan
    r = 0.0f;
    g = 255.0f;
    b = (-(wavelength - 510.0f) / (510.0f - 490.0f))*255.0f;
  } else if (wavelength >= 510 && wavelength < 580) {
    // Green
    r = ((wavelength - 510.0f) / (580.0f - 510.0f))*255.0f;
    g = 255.0f;
    b = 0.0f;
  } else if (wavelength >= 580 && wavelength < 645) {
    // Yellow
    r = 255.0f;
    g = (-(wavelength - 645.0f) / (645.0f - 580.0f))*255.0f;
    b = 0.0f;
  } else if (wavelength >= 645 && wavelength < 750) {
    // Red
    r = 255.0f;
    g = 0.0f;
    b = 0.0f;
  } else {
    r = 0.0f;
    g = 0.0f;
    b = 0.0f;
  }
  return color(r, g, b);
}
public int wavelengthId(int wavelength) {
  if (wavelength >= 380 && wavelength < 440) {
    // Violet
    return 6;
  } else if (wavelength >= 440 && wavelength < 490) {
    // Blue
    return 5;
  } else if (wavelength >= 490 && wavelength < 510) {
    // Cyan
    return 4;
  } else if (wavelength >= 510 && wavelength < 580) {
    // Green
    return 3;
  } else if (wavelength >= 580 && wavelength < 645) {
    // Yellow
    return 2;
  } else if (wavelength >= 645 && wavelength < 750) {
    // Red
    return 1;
  } else if (wavelength >= 750 && wavelength < 1100) {
    // Infrated
    return 7;
  } else if (wavelength >= 1100 && wavelength < 2010) {
    // Radar
    return 8;
  } else if (wavelength >= -900 && wavelength < 380) {
    // Ultraviolet
    return 9;
  } else {
    // Black
    return -999;
  }
}
public int colorToWavelengthId(int a) {
  if(hex(a).equals("FFA349A4")){
    // Violet
    return 6;
  } else if (hex(a).equals("FF3F48CC")) {
    // Blue
    return 5;
  } else if (hex(a).equals("FF00A2E8")) {
    // Cyan
    return 4;
  } else if (hex(a).equals("FF22B14C")) {
    // Green
    return 3;
  } else if (hex(a).equals("FFFFF200")) {
    // Yellow
    return 2;
  } else if (hex(a).equals("FFED1C24")) {
    // Red
    return 1;
  } else if(hex(a).equals("FFFFFFFF")){
    //White
    return 0;
  } else if(hex(a).equals("FF880015")){
    //Infra
    return 7;
  } else if(hex(a).equals("FFC8BFE7")){
    //Radar
    return 8;
  } else if(hex(a).equals("FFFFAEC9")){
    //Ultra
    return 9;
  } else {
    // Black
    return -1;
  }
}
ArrayList<Light> L = new ArrayList<Light>();
public void spawnLight(){
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
  int c, rc;
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
  public void updateMovement(){
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
  public void showReflected(){
    if(reflected){
      fill(rc,(PApplet.parseInt((timeSpan-timePassed)*255/fluorescence)));
      noStroke();
      ellipse(x, y, 10, 10);
    }
  }
  public void show(){
    fill(c,alpha);
    noStroke();
    ellipse(x, y, 10, 10); 
  }
  public void reflection(){
    if(x>0 && x<map.width && y>0 && y<map.height){
      int pixel = map.pixels[PApplet.parseInt(y)*map.width+PApplet.parseInt(x)];
      if(brightness(pixel) != 0){
        int objectWl = colorToWavelengthId(pixel);
        if(objectWl == wlId ||(objectWl == 0)){
          vx *= 0.005f;
          vy *= 0.005f;
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
  public boolean delete(){
    if(timePassed > timeSpan)
      return true;
    else
      return false;
  }
}
public void updateWavelenght(MouseEvent a){
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
public void drawMap(){
  image(map,0,0);
}
public void loadMap(){
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
Player p;

class Player{
  int level = 1;
  boolean isUp, isDown, isLeft, isRight;
  float speed = 5;
  float xVel, yVel, xRPos, yRPos;
  int pxPos, pyPos, xPos, yPos;
  Player(float xPos, float yPos){
    this.xPos = PApplet.parseInt(xPos);
    this.yPos = PApplet.parseInt(yPos);
  } 
  public void display(){
  }
  public void setMove(int k, boolean isPressed){
    switch(k){
      case 'A':
        isLeft = isPressed;
        break;
      case 'S':
        isDown = isPressed;
        break;
      case 'D':
        isRight = isPressed;
        break;
      case 'W':
        isUp = isPressed;
        break;
    }
  }
  public void playerMove(){
    if(isRight){
      xVel = speed;
    }
    if(isLeft){
      xVel = -speed;
    }
    if(isUp){
      yVel = -speed;
    }
    if(isDown){
      yVel = speed;    
    }
  }
  public boolean checkCollision(){
    if(xRPos > speed && xRPos < map.width-speed && yRPos > speed && yRPos < map.height-speed){
      if(brightness(map.pixels[PApplet.parseInt(yPos + height/2)*map.width+PApplet.parseInt(xPos + width/2)]) > 30){
        if(xPos > pxPos) xPos--;
        if(xPos < pxPos) xPos++;
        if(yPos > pyPos) yPos--;
        if(yPos < pyPos) yPos++;
        return true;
      }else{
        pxPos = xPos;
        pyPos = yPos;
        return false;
      }
    }else{
      return false;
    }
  }
  public void updateMovement(){
    for(int i = 0; i < xVel; i++){
      xPos++;
      if(checkCollision()) break;
    }
    for(int i = 0; i > xVel; i--){
      xPos--;
      if(checkCollision()) break;
    }
    for(int i = 0; i < yVel; i++){
      yPos++;
      if(checkCollision()) break;
    }
    for(int i = 0; i > yVel; i--){
      yPos--;
      if(checkCollision()) break;
    }
    xVel = 0;
    yVel = 0;
  }
  public void translateMove(){
    translate(-xPos, -yPos);
  }
  public void playerEffects(){
    
  }
  public void updateRealPosition(){
    xRPos = xPos + width/2;
    yRPos = yPos + height/2;
  }
}
float pp, xoff;
public void prect(float x, float y, float w, float h){
  rect(x*pp+xoff, y*pp, w*pp, h*pp);
}
public void pline(float x, float y, float x2, float y2){
  line(x*pp+xoff, y*pp, x2*pp+xoff, y2*pp);
}
public void pellipse(float x, float y, float w, float h){
  ellipse(x*pp+xoff, y*pp, w*pp, h*pp);
}
public void showText(){
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
  }else if(wl >= 750 && wl < 1100){
    text("<Infrated>",height/2,50);
  }else if(wl >= 1100 && wl < 2010){
    text("<Radar>",height/2,50);
  }else if(wl >= 2010 && wl < 3100){
    text("<FM/TV>",height/2,50);
  }else if(wl >= 3100 && wl < 4010){
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

float teta = 0.0f;
float amplitude = 50.0f;
float period = 500.0f;
float dx; 
float[] yvalues = new float[900];
float interference;

public void updateWave() {
  teta += 0.1f + interference*0.01f;
  period = pow(map(wl,-3000,4999,4,80),1.5f);
  dx = TWO_PI / period;
  float x = teta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude+random(-interference,interference);
    x+=dx;
  }
  interference = 0;
}
public void showWave() {
  noStroke();
  fill(255);
  for (int x = 0; x < yvalues.length; x++) {
    if(x != yvalues.length-1){
      stroke(100);
      line(x, amplitude+25+yvalues[x], x+1, amplitude+20+yvalues[x+1]);
    }
  }
}
/*
1Red    ED1C24 | 237 28  36
xOrange FF7F27 | 255 127 39
2Yellow FFF200 | 255 242 00
3Green  22B14C | 34  177 76
4Cyan   00A2E8 | 00  162 232
5Blue   3F48CC | 63  72  204
6Violet A349A4 | 163 73  164

7Infra  880015
8Radar  C8BFE7
9Ultra  FFAEC9
*/
public void drawText(){
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
 // text("Não vá por cima",map.width/2-width/2+500,-height/2+200);
 // text("Você passou! 6969",map.width/2-width/2+400,map.height+height/2+200);
 // image(cake,map.width/2-width/2+200,map.height+height/2+300);
}


  public void settings() { size(900, 900, P2D); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Spectrum" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
