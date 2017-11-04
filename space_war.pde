Spaceship player;
Enermy[] enermies;
int numOfEnermies = 100;
int time;
int timer;

boolean keys[];

void setup()  {
  size(500,500);
  reset(); // initialization
}

void reset() { 
  time = 0;
  timer = millis();
  keys = new boolean[4]; // used to handle simultaneously two keys pressed
  player = new Spaceship();
  enermies = new Enermy[numOfEnermies];
  for(int i = 0; i < numOfEnermies; i++) {
    enermies[i] = new Enermy();
  }
}

void draw()  {
  background(0);
  //-----Score-----
  String timeCount = "";
  if(time < 10) {
    timeCount += "0" + time;
  } else {
    timeCount += time;
  }
  fill(25);
  textSize(400);
  text(timeCount,0,height - 100);
  //-----Update-----
  player.update();
  player.show();
  for(int i = 0; i < numOfEnermies; i++) {
    enermies[i].update();
    enermies[i].show();
    if(player.collide(enermies[i])) {
      reset(); // reset all elements if player collides with any enermy
    }
  }
  //-----Timer-----
  if(millis() - timer > 1000) {
    timer = millis();
    time++;
  }
}

void keyReleased() {
  if(keyCode == UP){
    keys[0] = false;
  }
  if(keyCode == DOWN){
    keys[1] = false;
  }
  if(keyCode == LEFT){
    keys[2] = false;
  }
  if(keyCode == RIGHT){
    keys[3] = false;
  }
}

void keyPressed() {
  if(keyCode == UP){
    keys[0] = true;
  }
  if(keyCode == DOWN){
    keys[1] = true;
  }
  if(keyCode == LEFT){
    keys[2] = true;
  }
  if(keyCode == RIGHT){
    keys[3] = true;
  }
}