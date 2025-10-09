 /* to do list
 rotate pan
 death anim
arrow class stuff
 */
 
 //variable stuff
void setup(){     
  background(0);
  size(640,480);
}   
 void draw()   
 {    
   //move and show the bacteria   
 }  
class Arrow{
  int myX, myY, direction;
  boolean tweaking, fast;
  Arrow(){
    
  }
  int direc(){
    direction = (int)(Math.random()*4);
    return direction;
  }
  boolean tweak(){
    tweaking = ((int)(Math.random()*4)==0);
    return tweaking;
  }
  boolean speed(){
    fast = ((int)(Math.random()*4)==0);
    return fast;
  }
  void move(){
    if (direction == 0);{
      
    }
  }
  void show(){
  }
 }//Arrow class
