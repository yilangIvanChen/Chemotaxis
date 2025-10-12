/*
pond ripples
 expand
 dependent on hold duration
 fade away
 
 if time permits:
 fishies :thumbsup:
 */
/////////////////////////variables///////////////////////////////////

Bubble[] z;
int heldTime = 0;
boolean release = false;
int storage;

///////////////////////////drawing stuff/////////////////////////////

void setup() {
  background(190, 220, 255);
  size(800, 800);
}   


void draw() {
  background(190, 220, 255);
  if (mousePressed) {
    heldTime++;
    release = false;
    if (heldTime > 120)
      heldTime = 120;
  }
  if (release) {
    for (int i = 0; i < z.length; i++) {
      z[i].floatAway();
      z[i].show();
    }
    heldTime = 0;
  }
}


void mouseReleased() {
  storage = heldTime;
  z = new Bubble[(int)(Math.random()*5)+5];
  for (int i = 0; i < z.length; i++)
    z[i] = new Bubble(mouseX, mouseY, storage);
  release = true;
}

///////////////////////class stuff///////////////////////////////////////////////

class Bubble {     
  int size, myX, myY, blue, green, fade, fadeFactor, held;
  Bubble(int x, int y, int z) {
    myX = x;
    myY = y;
    fade = 500;
    fadeFactor = (int)(Math.random()*25)+10;
    size = (int)(Math.random()*36)+24;
    blue = (int)(Math.random()*45)+210;
    green = (int)(Math.random()*15)+180;
    held = z;
  }
  void floatAway() {
    myX += (int)(Math.random()*(7+held/2))-(7+held/2)/2;
    myY += (int)(Math.random()*(7+held/2))-(7+held/2)/2;
    fade -= .6*fadeFactor;
  }
  void show() {
    noStroke();
    fill(110, green, blue, fade);
    ellipse(myX, myY, size, size);
  }
}    

//*********************WIP***********************************
class Ripple {
  int myX, myY, held, fade, fadeFactor, size;
  Ripple(int x, int y, int z) {
    myX = x;
    myY = y;
    fade = 500;
    fadeFactor = 25;
    held = z;
  }
  void expandRipple() {
    size += held;
    fade -= .6*fadeFactor;
  }
  void show() {
    noFill();
    stroke(190, 220, 255, fade);
    ellipse(myX, myY, size, size);
  }
}
