// Flash.pde

class Buttons{
  // button one coordinates
  int buttonOneX;
  int buttonOneY;
  // button one dimensions
  int buttonOneW;
  int buttonOneH;
  // button one modifiers
  int buttonOneS;
  color buttonOneC;
  // button two coordinates
  int buttonTwoX;
  int buttonTwoY;
  // button two dimensions
  int buttonTwoW;
  int buttonTwoH;
  // button two modifiers
  int buttonTwoS;
  color buttonTwoC;

  Buttons( color buttonOne, color buttonTwo ){
    // button one
    buttonOneX = 54; // x position of the button one, based on px from ( 0,0 )
    buttonOneY = -90; //  y position of the button one, based on px from ( 0,0 )
    buttonOneW = 34; // width of the button one
    buttonOneH = 14; // height of the button one
    buttonOneS = 2; // stroke of the button one
    buttonOneC = buttonOne; // color of button one
    // button two
    buttonTwoX = 103; // x position of the button two, based on px from ( 0,0 )
    buttonTwoY = -90; //  y position of the button two, based on px from ( 0,0 )
    buttonTwoW = 43; // width of the button two
    buttonTwoH = 14; // height of the button two
    buttonTwoS = 2; // stroke of the button two
    buttonTwoC = buttonTwo; // color of button two
  }

  void buttonOne(){
    pushMatrix(); // restrict settings to just this instance
    stroke( buttonOneS ); // stroke width for button one
    fill( buttonOneC ); // set the color of button one
    rectMode( CENTER ); // set axis to center point of button one
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( buttonOneX, buttonOneY, buttonOneW, buttonOneH ); // draw button one
    popMatrix();
  }

  void buttonTwo(){
    pushMatrix(); // restrict settings to just this instance
    stroke( buttonTwoS ); // stroke witdth for button two
    fill( buttonTwoC ); // set the color of button two
    rectMode( CENTER ); // set axis to center point of button two
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( buttonTwoX, buttonTwoY, buttonTwoW, buttonTwoH ); // draw button two
    popMatrix();
  }

  void compose(){
    buttonOne();
    buttonTwo();
  }

}
