/*
pond ripples
 expand
 dependent on hold duration
 fade away
 bubbles (actual assignment)
 dependent on hold duration (work on this next, me next time)
 
 if time permits:
 fishies :thumbsup:
 */
Bubble[] z;
void setup() {
  z = new Bubble[(int)(Math.random()*5)+5];
  for (int i = 0; i < z.length; i++)
    z[i] = new Bubble(400, 400);
  background(190, 220, 255);
  size(800, 800);
}   


void draw() {
  background(190, 220, 255);
  for (int i = 0; i < z.length; i++) {
    z[i].floatAway();
    z[i].show();
  }
}  



void mousePressed() {
  z = new Bubble[(int)(Math.random()*5)+5];
  for (int i = 0; i < z.length; i++)
    z[i] = new Bubble(mouseX, mouseY);
}


class Bubble {     
  int size, myX, myY, blue, green, fade, fadeFactor;
  Bubble(int x, int y) {
    myX = x;
    myY = y;
    fade = 500;
    fadeFactor = (int)(Math.random()*15)+5;
    size = (int)(Math.random()*36)+24;
    blue = (int)(Math.random()*45)+210;
    green = (int)(Math.random()*15)+180;
  }
  void floatAway() {
    myX += (int)(Math.random()*10)-5;
    myY += (int)(Math.random()*10)-5;
    fade -= .6*fadeFactor;
  }
  void show() {
    noStroke();
    fill(110, green, blue, fade);
    ellipse(myX, myY, size, size);
  }
}    
