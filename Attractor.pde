
/*  2017.03.27
*/

class Attractor {

  float mass ;
  PVector location ;
  float g ;
  
  Attractor() {
    location = new PVector( 0 , 0 ) ;
    mass = 20.0 ;
    g = 0.4 ;
  }
  
  
  PVector attract( Mover m ) {
    
    PVector dir = PVector.sub( location , m.location ) ;
    float distance = constrain( dir.mag() , 5.0 , 25.0 ) ;
    
    dir.normalize() ;
    PVector force = dir.get() ;
    
    float strength = ( g * mass * mass ) / (distance * distance) ;
    force.mult( strength ) ;
    
    return force ;
  }
  
  
  void display() {
    stroke(255);
    noFill();
    
    pushMatrix();
    translate( location.x , location.y , location.z ) ;
    sphere( mass*2 ) ;
    popMatrix();
  }
  
}
