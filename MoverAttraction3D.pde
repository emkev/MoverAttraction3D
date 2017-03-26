
/* base on Daniel Shiffman 's code  
   2017.03.27
*/

Mover[] movers = new Mover[10] ;

Attractor attrc ;

float angle = 0.0 ;


void setup() {

  size( 640 , 360 , P3D ) ;
  background(255);
  
  for( int i = 0 ; i < movers.length ; i++ ) {
    movers[i] = new Mover( random( 0.1 , 2 ) ,
                           random( (-1)*(width/2)  , width/2  ) ,
                           random( (-1)*(height/2) , height/2 ) ,
                           random( (-1)*100        , 100 )
                         ) ;
  }
  
  attrc = new Attractor() ;
  
}

void draw() {
  
  background(200) ;
  sphereDetail(8) ;
  lights() ;
  translate( width/2 , height/2 ) ;
  rotateY( angle ) ;
  
  attrc.display() ;
  
  for( int i = 0 ; i < movers.length ; i++ ) {
    PVector force = attrc.attract( movers[i] ) ;
    
    movers[i].applyForce( force ) ;
    movers[i].update() ;
    movers[i].display() ;
  }
  
  angle += 0.003 ;
  
}
