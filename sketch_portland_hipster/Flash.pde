// Flash.pde

class Flash{
  // flash coordinates
  int flashXCoor;
  int flashYCoor;
  // flash dimensions
  int flashWidth;
  int flashHeight;
  int flashBorderWidth;
  int flashBorderHeight;
  // flash modifiers
  color flashColor;

  Flash( color flashColor ){
    flashXCoor = -110; // x position of the flash, based on px from ( 0,0 )
    flashYCoor = -71; //  y position of the flash, based on px from ( 0,0 )
    flashWidth = 48; // width of the flash
    flashHeight = 22; // height of the flash
    flashBorderWidth = 50; // width of the flash
    flashBorderHeight = 24; // height of the flash
    flashColor = flashColor; // color of the flash
  }

  void flash(){
    pushMatrix();
    noStroke();
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    fill(0,0,0);
    rect( flashXCoor, flashYCoor, flashBorderWidth, flashBorderHeight ); // draw the flash border
    fill( flashColor ); // set the color of the accent rectangle
    rect( flashXCoor, flashYCoor, flashWidth, flashHeight ); // draw the flash
    popMatrix();
  }

  void compose(){
    flash();
  }

}
