import processing.sound.*;

SoundFile music;

float y = 60;
float z = 60;
int score;
boolean pressed;

//bouncing ball
float circleX;
float xspeed = 10;
float yspeed = 15;

void setup(){
  size(800,800);
  noStroke();
  textAlign(CENTER);
  circleX = 0;
  
  //play music
  music = new SoundFile(this, "duck.mp3");
  music.play();
  
}

void draw(){
background(200);
fill(0);

//ball
ellipse(circleX,y,z,z);
circleX = circleX + xspeed;
y = y + yspeed;

//text: score & instructions
textSize(30);
text("Left click to catch the ball, if you missed your score will reset.",width/2,40);
textSize(40);
text("Score: " + score,width/2,100);

//bouncing ball
if(circleX >= width || circleX <= 0) {
  xspeed = xspeed * -1;
}
if(y >= width || y <= 0) {
  yspeed = yspeed * -1;
}

//click on the ball
if(!pressed && mousePressed) {
  pressed = true;
  if(mouseX > circleX - (z) && mouseY > y - (z) && mouseX < circleX + (z) && mouseY < y + (z)){
    score++;
    randomPos();
  }
  else {
    reset(); 
  }
}
if(pressed && !mousePressed) {
  pressed = false;
}
}

void reset() {
  circleX = width/2;
  y = width/2;
  score = 0;
  
}

void randomPos() {
  circleX = random (z, width - z);
  y = random (z, width - z);
}
