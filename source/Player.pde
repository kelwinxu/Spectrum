Player p;

class Player{
  boolean isUp, isDown, isLeft, isRight;
  float speed = 5;
  float xVel, yVel, xRPos, yRPos;
  int pxPos, pyPos, xPos, yPos;
  Player(float xPos, float yPos){
    this.xPos = int(xPos);
    this.yPos = int(yPos);
  } 
  void display(){
  }
  void setMove(int k, boolean isPressed){
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
  void playerMove(){
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
  boolean checkCollision(){
    if(xRPos > speed && xRPos < map.width-speed && /*yRPos > speed &&*/ yRPos < map.height-speed){
      if(brightness(map.pixels[int(yPos + height/2)*map.width+int(xPos + width/2)]) > 210){
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
  void updateMovement(){
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
  void translateMove(){
    translate(-xPos, -yPos);
  }
  void playerEffects(){
    
  }
  void updateRealPosition(){
    xRPos = xPos + width/2;
    yRPos = yPos + height/2;
  }
}
