// Background.pde

class Background{

  // background modifiers
  color bgColor;
  // rotated rectangle coordinates
  int bgAccRectXCoor;
  int bgAccRectYCoor;
  // rotated rectangle dimensions
  int bgAccRectWidth;
  int bgAccRectHeight;
  // rotated rectangle modifiers
  int bgAccRectDegrees;
  color bgAccRectColor;

  Background(color background, color accent){
    bgColor = background; // The color of the canvas
    bgAccRectColor = accent ; // The color of the rotated rectangle
    bgAccRectXCoor = 0; // x position of the rotated rectangle, based on px from ( 0,0 )
    bgAccRectYCoor = 0; // y position of the rotated rectangle, based on px from ( 0,0 )
    bgAccRectWidth = 673; // The width of the rotated rectangle in px
    bgAccRectHeight = 386; // The height of the rotated rectangle in px
    bgAccRectDegrees = 315; // The angle of the rotated rectangle in deg out of 360
  }

  void bg(){
    background( bgColor ); // color of the background
  }

  void backgroundRect(){
    pushMatrix(); // restrict settings to just this instance
    noStroke(); // no outline
    fill( bgAccRectColor ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rotate( radians( bgAccRectDegrees ) ); // rotate the accent rectangle
    rect( bgAccRectXCoor, bgAccRectYCoor, bgAccRectWidth, bgAccRectHeight ); // draw the accent rectangle
    popMatrix();
  }

  void compose(){
    bg();
    backgroundRect();
  }

}
