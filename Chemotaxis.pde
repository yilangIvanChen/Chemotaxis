/*
 if time permits:
 fishies :thumbsup: (likely not)
 ambience (make it not as empty, just decorative stuff)
 */

/////////////////////////variables///////////////////////////////////

Bubble[] z;
Ripple[] ripples;
int heldTime = 0;
boolean release = false;
int storage;

///////////////////////////drawing stuff/////////////////////////////

void setup() {
  background(#B2D8F5);
  size(800, 800);
}   


void draw() {
  background(#B2D8F5);
  fill(100, 140, 170, heldTime*6);
  noStroke();
  ellipse(mouseX, mouseY, heldTime*8, heldTime*8);
  if (mousePressed) {
    heldTime++;
    release = false;
  }
  if (heldTime > 30)
    heldTime = 30;
  if (heldTime < 0)
    heldTime = 0;
  if (release) {
    for (int i = 0; i < ripples.length; i++) {
      ripples[i].expandRipple(i+1);
      ripples[i].show();
    }
    for (int i = 0; i < z.length; i++) {
      z[i].floatAway();
      z[i].show();
    }
    heldTime -= 3;
  }
}


void mouseReleased() {
  storage = heldTime;
  ripples = new Ripple[3];
  for (int i = 0; i < ripples.length; i++)
    ripples[i] = new Ripple(mouseX, mouseY, storage);
  z = new Bubble[(int)(Math.random()*3)+3];
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
    fade = 350;
    fadeFactor = (int)(Math.random()*15)+10;
    size = (int)(Math.random()*24)+z*2;
    blue = (int)(Math.random()*45)+210;
    green = (int)(Math.random()*30)+170;
    held = z;
  }
  void floatAway() {
    myX += (int)(Math.random()*(7+held*2))-(7+held*2)/2;
    myY += (int)(Math.random()*(7+held*2))-(7+held*2)/2;
    fade -= .35*fadeFactor;
  }
  void show() {
    noStroke();
    fill(110, green, blue, fade);
    ellipse(myX, myY, size, size);
  }
}    


class Ripple {
  int myX, myY, fade, fadeFactor, maxSize, size;
  Ripple(int x, int y, int z) {
    myX = x;
    myY = y;
    maxSize = z+2;
    size = 0;
    fade = 500;
    fadeFactor = 25;
  }
  void expandRipple(int z) {
    size += maxSize*3/z;
    fade -= 500/(z*10);
  }
  void show() {
    noFill();
    stroke(90, 90, 210, fade);
    ellipse(myX, myY, size, size);
  }
}
