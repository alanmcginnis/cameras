// Buttons.pde

class Buttons{
  // button one coordinates
  int buttonOneXCoor;
  int buttonOneYCoor;
  // button one dimensions
  int buttonOneWidth;
  int buttonOneHeight;
  // button one modifiers
  int buttonOneStroke;
  color buttonOneColor;
  // button two coordinates
  int buttonTwoXCoor;
  int buttonTwoYCoor;
  // button two dimensions
  int buttonTwoWidth;
  int buttonTwoHeight;
  // button two modifiers
  int buttonTwoStroke;
  color buttonTwoColor;

  Buttons( color buttonOne, color buttonTwo ){
    // button one
    buttonOneXCoor = 54; // x position of the button one, based on px from ( 0,0 )
    buttonOneYCoor = -90; //  y position of the button one, based on px from ( 0,0 )
    buttonOneWidth = 34; // width of the button one
    buttonOneHeight = 14; // height of the button one
    buttonOneStroke = 2; // stroke of the button one
    buttonOneColor = buttonOne; // color of button one 
    // button two
    buttonTwoXCoor = 103; // x position of the button two, based on px from ( 0,0 )
    buttonTwoYCoor = -90; //  y position of the button two, based on px from ( 0,0 )
    buttonTwoWidth = 46; // width of the button two
    buttonTwoHeight = 13; // height of the button two
    buttonTwoStroke = 2; // stroke of the button two
    buttonTwoColor = buttonTwo; // color of button two
  }

  void buttonOne(){
    pushMatrix(); // restrict settings to just this instance
    stroke( buttonOneStroke ); // stroke width for button one
    fill( buttonOneColor ); // set the color of button one
    rectMode( CENTER ); // set axis to center point of button one
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( buttonOneXCoor, buttonOneYCoor, buttonOneWidth, buttonOneHeight ); // draw button one
    popMatrix();
  }

  void buttonTwo(){
    pushMatrix(); // restrict settings to just this instance
    stroke( buttonTwoStroke ); // stroke witdth for button two
    fill( buttonTwoColor ); // set the color of button two
    rectMode( CENTER ); // set axis to center point of button two
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( buttonTwoXCoor, buttonTwoYCoor, buttonTwoWidth, buttonTwoHeight ); // draw button two
    popMatrix();
  }

  void compose(){
    buttonOne();
    buttonTwo();
  }

}
