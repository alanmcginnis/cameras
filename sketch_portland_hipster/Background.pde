// Background.pde

class Background{

  // background modifiers
  color bgC;
  // rotated rectangle coordinates
  int bgAccRectX;
  int bgAccRectY;
  // rotated rectangle dimensions
  int bgAccRectW;
  int bgAccRectH;
  // rotated rectangle modifiers
  int bgAccRectDeg;
  color bgAccRectC;

  Background(color background, color accent){
    bgC = background; // The color of the canvas
    bgAccRectC = accent ; // The color of the rotated rectangle
    bgAccRectX = 0; // x position of the rotated rectangle, based on px from ( 0,0 )
    bgAccRectY = 0; // y position of the rotated rectangle, based on px from ( 0,0 )
    bgAccRectW = 673; // The width of the rotated rectangle in px
    bgAccRectH = 386; // The height of the rotated rectangle in px
    bgAccRectDeg = 315; // The angle of the rotated rectangle in deg out of 360
  }

  void bg(){
    background( bgC ); // color of the background
  }

  void backgroundRect(){
    pushMatrix(); // restrict settings to just this instance
    noStroke(); // no outline
    fill( bgAccRectC ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rotate( radians( bgAccRectDeg ) ); // rotate the accent rectangle
    rect( bgAccRectX, bgAccRectY, bgAccRectW, bgAccRectH ); // draw the accent rectangle
    popMatrix();
  }

  void compose(){
    bg();
    backgroundRect();
  }

}
