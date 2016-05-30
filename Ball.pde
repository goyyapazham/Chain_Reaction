class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 20;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  

 void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
 
 void bounce() {
   if (x>=600){
     dx = -dx;
   }
   if (x<=0) {
     dx = -dx;
   }
   if (y>=600) {
     dy = -dy;
   }
   if (y<=0) {
     dy = -dy;
   }
   
 }
 
 boolean isTouching( Ball other ) {
   //implementation
   return ((x-rad)*(x-rad) + (y-rad)*(y-rad)) == 
          ((other.x-other.rad)*(other.x-other.rad) + (other.y-other.rad)*(other.y-other.rad));
 }
 
 void draw(float i) { 
   ellipse(x,y,rad,rad);
 }
 
 void process() {
   if (state == 0 ) move();
   else if (state == 1 ) {
     while (rad < 50) {
       draw(rad + 1);
     }
     state = 2;
   } 
   else if (state == 2) {
     while (rad > 0) {
       draw(rad - 1);
     }
     state=3;
   }
   else if (state == 3 ) {
    rad=0; 
   }
   
 }
  
}//end class Ball