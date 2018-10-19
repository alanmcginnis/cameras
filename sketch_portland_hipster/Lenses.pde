// Lenses.pde

class Lenses{
  // global lenses coordinates
  int lensesXCoor;
  int lensesYCoor;
  // global lenses modifiers
  int   lensesStroke;
  int   lensNineWidthHeight;
  color lensNineColor;
  int   lensEightWidthHeight;
  color lensEightColor;
  int   lensSevenWidthHeight;
  color lensSevenColor;
  int   lensSixWidthHeight;
  color lensSixColor;
  int   lensFiveWidthHeight;
  color lensFiveColor;
  int   lensFourWidthHeight;
  color lensFourColor;
  int   lensThreeWidthHeight;
  color lensThreeColor;
  int   lensTwoWidthHeight;
  color lensTwoColor;
  int   lensOneWidthHeight;
  color lensOneColor;

  Lenses( color l9, color l8, color l7, color l6, color l5, color l4, color l3, color l2, color l1){
    lensesXCoor          = 0; // x position for all lenses, based on px from ( 0,0 )
    lensesYCoor          = 0; // y position for all lenses, based on px from ( 0,0 )
    lensesStroke         = 2; // stroke in px for lenses with stroke
    lensNineColor        = l9;
    lensNineWidthHeight  = 145;
    lensEightColor       = l8;
    lensEightWidthHeight = 137;
    lensSevenColor       = l7;
    lensSevenWidthHeight  = 114;
    lensSixColor         = l6;
    lensSixWidthHeight   = 107;
    lensFiveColor        = l5;
    lensFiveWidthHeight  = 80;
    lensFourColor        = l4;
    lensFourWidthHeight  = 69;
    lensThreeColor       = l3;
    lensThreeWidthHeight = 50;
    lensTwoColor         = l2;
    lensTwoWidthHeight   = 33;
    lensOneColor         = l1;
    lensOneWidthHeight   = 21;
  }

  void lensNine(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensNineColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensNineWidthHeight,lensNineWidthHeight );
    popMatrix();
  }

  void lensEight(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensEightColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensEightWidthHeight,lensEightWidthHeight );
    popMatrix();
  }

  void lensSeven(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensSevenColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensSevenWidthHeight,lensSevenWidthHeight );
    popMatrix();
  }

  void lensSix(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensSixColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensSixWidthHeight,lensSixWidthHeight );
    popMatrix();
  }

  void lensFive(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensFiveColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensFiveWidthHeight,lensFiveWidthHeight );
    popMatrix();
  }

  void lensFour(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensFourColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensFourWidthHeight,lensFourWidthHeight );
    popMatrix();
  }

  void lensThree(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensThreeColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensThreeWidthHeight,lensThreeWidthHeight );
    popMatrix();
  }

  void lensTwo(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensTwoColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensTwoWidthHeight,lensTwoWidthHeight );
    popMatrix();
  }

  void lensOne(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensOneColor );
    noStroke();
    ellipse( lensesXCoor, lensesYCoor, lensOneWidthHeight,lensOneWidthHeight );
    popMatrix();
  }

  void lensOnePsuedoStroke(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noFill();
    stroke( lensesStroke );
    ellipse( lensesXCoor, lensesYCoor, lensOneWidthHeight,lensOneWidthHeight );
    popMatrix();
  }

  void compose(){
    lensNine();
    lensEight();
    lensSeven();
    lensSix();
    lensFive();
    lensFour();
    lensThree();
    lensTwo();
    lensOne();
  }

}
