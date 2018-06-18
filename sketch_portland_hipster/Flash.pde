// Flash.pde

class Flash{
  // flash coordinates
  int flashX;
  int flashY;
  // flash dimensions
  int flashW;
  int flashH;
  int flashBorderW;
  int flashBorderH;
  // flash modifiers
  color flashC;

  Flash( color primary ){
    flashX = -110; // x position of the flash, based on px from ( 0,0 )
    flashY = -71; //  y position of the flash, based on px from ( 0,0 )
    flashW = 48; // width of the flash
    flashH = 22; // height of the flash
    flashBorderW = 50; // width of the flash
    flashBorderH = 24; // height of the flash
    flashC = primary; // color of the flash
  }

  void flash(){
    pushMatrix(); // restrict settings to just this instance
    noStroke();
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    fill(0,0,0);
    rect( flashX, flashY, flashBorderW, flashBorderH ); // draw the flash border
    fill( flashC ); // set the color of the accent rectangle
    rect( flashX, flashY, flashW, flashH ); // draw the flash
    popMatrix();
  }

  void compose(){
    flash();
  }

}
