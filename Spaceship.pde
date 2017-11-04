class Spaceship {
  float x, y; // position of top-left corner of this square
  float w; // width of the square
  color c = color(255,0,0);
  float speed = 3;
  
  Spaceship() {
    x = width / 2;
    y = height / 2;
    w = 10;
  }
  
  void update() {
    if(keys[0] && !keys[1]) {
      y -= speed;
    } else if(keys[1] && !keys[0]) {
      y += speed;
    }
    y = constrain(y, 0, height - 10);
    if(keys[2] && !keys[3]) {
      x -= speed;
    } else if(keys[3] && !keys[2]) {
      x += speed;
    }
    x = constrain(x, 0, width - 10);
  }
  
  void show() {
    noStroke();
    fill(c);
    rect(x,y,w,w);
  }
  
  boolean collide(Enermy e) {
    if(x + w > e.x &&
       e.x + e.w > x &&
       y + w > e.y &&
       e.y + e.w > y)
      return true;
    else
      return false;
  }
}