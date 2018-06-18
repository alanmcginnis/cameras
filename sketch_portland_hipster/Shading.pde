// Shading.pde

class Shading{

  // lens highlight coordinates
  int lensHighlightX;
  int lensHighlightY;
  // lens highlight dimensions
  int lensHighlightWH;
  // lens highlight modifiers
  float lensHighlightStart;
  float lensHighlightEnd;
  color lensHighlightC;
  // flash highlight coordinates
  int flashHighlightVertOneX;
  int flashHighlightVertOneY;
  int flashHighlightVertTwoX;
  int flashHighlightVertTwoY;
  int flashHighlightVertThreeX;
  int flashHighlightVertThreeY;
  // flash highlight modifiers
  color flashHighlightC;
  // large lens glare coordinates
  int lensGlareLargeX;
  int lensGlareLargeY;
  // large lens glare dimensions
  int lensGlareLargeWH;
  // large lens glare modifiers
  color lensGlareLargeC;
  // small lens glare coordinates
  int lensGlareSmallX;
  int lensGlareSmallY;
  // small lens glare dimensions
  int lensGlareSmallWH;
  // small lens glare modifiers
  color lensGlareSmallC;
  // body shadow coordinates
  int cameraBodyShadowX;
  int cameraBodyShadowY;
  // body shadow dimensions
  int cameraBodyShadowWH;
  // body shadow modifiers
  color cameraBodyShadowC;

  Shading( color lensHighlight, color flashHighlight, color lensGlare, color cameraBodyShadow ){
    lensHighlightWH = 136; // widht and height of lens highlight
    lensHighlightX = 0; // x position of lens highlight
    lensHighlightY = 0; // y position of lens highlight
    lensHighlightStart = 3*PI/4; // start of highlight arc in radians
    lensHighlightEnd = 7*PI/4; // end of highlight arc in radians
    lensHighlightC = lensHighlight; // The color of lens highlight
    flashHighlightVertOneX = 172; // x position of vertex 1
    flashHighlightVertOneY = 422; // y position of vertex 1
    flashHighlightVertTwoX = 196; // x position of vertex 2
    flashHighlightVertTwoY = 422; // y position of vertex 2
    flashHighlightVertThreeX = 172; // x position of vertex 3
    flashHighlightVertThreeY = 444; // y position of vertex 3
    flashHighlightC = flashHighlight; // color of flash highlight
    lensGlareLargeX = 5; // x position for large lens glare
    lensGlareLargeY = -5; // y position for large lens glare
    lensGlareLargeWH = 7; // width and height for large lens glare
    lensGlareLargeC = lensGlare; // color for large lens glare
    lensGlareSmallX = -6; // x position for small lens glare
    lensGlareSmallY = 6; // y position for small lens glare
    lensGlareSmallWH = 3; // width and height for small lens glare
    lensGlareSmallC = lensGlare; // color for small lens glare
  }

  void lensHighlight(){
    pushMatrix();
    translate( width/2, height/2 );
    fill( lensHighlightC );
    arc( lensHighlightX, lensHighlightY, lensHighlightWH, lensHighlightWH, lensHighlightStart, lensHighlightEnd, OPEN);
    print(lensHighlightWH);
    popMatrix();
  }

  void lensGlareLarge(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noStroke();
    fill( lensGlareLargeC );
    ellipse( lensGlareLargeX, lensGlareLargeY, lensGlareLargeWH, lensGlareLargeWH );
    popMatrix();
  }

  void lensGlareSmall(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noStroke();
    fill( lensGlareSmallC );
    ellipse( lensGlareSmallX, lensGlareSmallY, lensGlareSmallWH, lensGlareSmallWH );
    popMatrix();
  }

  void flashHighlight(){
    beginShape( TRIANGLES );
    noStroke();
    fill( flashHighlightC );
    vertex( flashHighlightVertOneX, flashHighlightVertOneY );
    vertex( flashHighlightVertTwoX, flashHighlightVertTwoY );
    vertex( flashHighlightVertThreeX, flashHighlightVertThreeY );
    endShape();
  }

  void compose(){
    lensGlareLarge();
    lensGlareSmall();
    lensHighlight();
    flashHighlight();
  }

}
