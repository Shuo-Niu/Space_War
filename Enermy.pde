class Enermy {
  float x,y; // position of top-left corner of this square
  float w; // width of the square
  float dx, dy; // delta
  color c = color(255);
  float speed = 1;
  
  Enermy() {
    reset(); // initialization
  }
  
  void reset() { 
    w = 5;
    int type = floor(random(4));
    switch(type) {
      case 0: { // launch from top
        x = random(width + 1);
        y = -1;
        dx = random(-1,1);
        dy = sqrt(pow(speed,2) - pow(dx,2));
        break;
      }
      case 1: { // launch from bottom
        x = random(width + 1);
        y = height;
        dx = random(-1,1);
        dy = -sqrt(pow(speed,2) - pow(dx,2));
        break;
      }
      case 2: { // launch from left
        x = -1;
        y = random(height + 1);
        dy = random(-1,1);
        dx = sqrt(pow(speed,2) - pow(dy,2));
        break;
      }
      case 3: { // launch from right
        x = width;
        y = random(height + 1);
        dy = random(-1,1);
        dx = -sqrt(pow(speed,2) - pow(dy,2));
        break;
      }
    }
  }
  
  void update() {
    x += dx;
    y += dy;
    if(x < -1 || x > width + 1 || y < -1 || y > height + 1) {
      reset(); // reset this square if it goes out of the screen
    }
  }
  
  void show() {
    noStroke();
    fill(c);
    rect(x,y,w,w);
  }
}