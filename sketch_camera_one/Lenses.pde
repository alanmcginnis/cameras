// Lenses.pde

class Lenses{
  // global lenses coordinates
  int lensesX;
  int lensesY;
  // global lenses modifiers
  int lensesS;
  // lens 7 dimensions
  int lensSevenWH;
  // lens 7 modifiers
  color lensSevenC;
  // lens 6 dimensions
  int lensSixWH;
  // lens 6 modifiers
  color lensSixC;
  // lens 5 dimensions
  int lensFiveWH;
  // lens 5 modifiers
  color lensFiveC;
  // lens 4 dimensions
  int lensFourWH;
  // lens 4 modifiers
  color lensFourC;
  // lens 3 dimensions
  int lensThreeWH;
  // lens 3 modifiers
  color lensThreeC;
  // lens 2 dimensions
  int lensTwoWH;
  // lens 2 modifiers
  color lensTwoC;
  // lens 1 dimensions
  int lensOneWH;
  // lens 1 modifiers
  color lensOneC;

  Lenses( color l7, color l6, color l5, color l4, color l3, color l2, color l1){
    lensesX     = 0; // x position for all lenses, based on px from ( 0,0 )
    lensesY     = 0; // y position for all lenses, based on px from ( 0,0 )
    lensesS     = 2; // stroke in px for lenses with stroke
    lensOneWH   = 136; // width and height of lens seven
    lensOneC    = l7; // The color of lens seven
    lensTwoWH   = 123; // width and height of lens six
    lensTwoC    = l6; // The color of lens six
    lensThreeWH = 101; // width and height of lens five
    lensThreeC  = l5; // The color of lens five
    lensFourWH  = 93; // width and height of lens four
    lensFourC   = l4; // The color of lens four
    lensFiveWH  = 48; // width and height of lens three
    lensFiveC   = l3; // The color of lens three
    lensSixWH   = 48; // width and height of lens two
    lensSixC    = l2; // The color of lens two
    lensSevenWH = 28; // width and height of lens one
    lensSevenC  = l1; // The color of lens one
  }

  void lensOne(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensOneC );
    // stroke( lensesS );
    ellipse( lensesX, lensesY, lensOneWH,lensOneWH );
    popMatrix();
  }

  void lensTwo(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensTwoC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensTwoWH,lensTwoWH );
    popMatrix();
  }

  void lensThree(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensThreeC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensThreeWH,lensThreeWH );
    popMatrix();
  }

  void lensFour(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensFourC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensFourWH,lensFourWH );
    popMatrix();
  }

  void lensFive(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensFiveC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensFiveWH,lensFiveWH );
    popMatrix();
  }

  void lensSix(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensSixC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensSixWH,lensSixWH );
    popMatrix();
  }

  void lensSeven(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensSevenC );
    noStroke();
    ellipse( lensesX, lensesY, lensSevenWH,lensSevenWH );
    popMatrix();
  }

  void lensOnePsuedoStroke(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noFill();
    stroke(lensesS);
    ellipse( lensesX, lensesY, lensOneWH,lensOneWH );
    popMatrix();
  }

  void compose(){
    lensOne();
    lensTwo();
    lensThree();
    lensFour();
    lensFive();
    lensSix();
    lensSeven();
  }

}
