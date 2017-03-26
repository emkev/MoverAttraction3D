
/* 2017.03.27
*/

class Mover {
  
  PVector location ; 
  PVector velocity ; 
  PVector acceleration ; 
  float mass ;

  float r ; 
  float maxSpeed ; 
  float maxForce ; 

  Mover( float m , float locX , float locY , float locZ ) {
    mass = m ;
    location     = new PVector( locX , locY , locZ ) ; 
    velocity     = new PVector( 1 , 0 ) ; 
    acceleration = new PVector( 0 , 0 ) ; 

    r = 3.0 ; 
    maxSpeed = 2.0 ; 
    maxForce = 0.1 ; 
  }

  void run() {
    update() ;
    checkEdge() ;
    display() ;
  }
  
  void update()
  {
    velocity.add(acceleration) ; 
    //velocity.limit(maxSpeed) ; 
    location.add(velocity) ; 
    acceleration.mult(0) ; 
  }

  void applyForce(PVector force) {
    PVector f = PVector.div( force , mass ) ;
    acceleration.add(f) ; 
  }

  void display()
  {
    noStroke() ;
    fill(255) ; 

    pushMatrix() ; 
    translate( location.x , location.y , location.z ) ; 
    sphere( mass * 8 ) ;
    popMatrix() ; 
  }

  
  void checkEdge() {
    if( location.x > width ) {
      location.x = 0 ;
    }
    else if( location.x < 0 ) {
      location.x = width ;
    }
    else {
    }
    
    if( location.y > height ) {
      velocity.y *= -1 ;
      location.y = height ;
    }
    
  }  
  
}
