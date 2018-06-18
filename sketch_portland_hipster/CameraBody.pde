class CameraBody{

  // camera body coordinates
  int cameraBodyX;
  int cameraBodyY;
  // camera body dimensions
  int cameraBodyW;
  int cameraBodyH;
  // camera body modifiers
  int cameraBodyCR;
  int cameraBodyS;
  color cameraBodyC;
  color cameraBodyAccentC;

  // camera body accent coordinates
  int cameraBodyAccentX;
  int cameraBodyAccentY;
  // camera body accent dimensions
  int cameraBodyAccentW;
  int cameraBodyAccentH;
  // camera body accent modifiers
  int cameraBodyAccentS;


  CameraBody( color body, color accent ){
    // Camera Body
    cameraBodyC = body; // The color of the camera body
    cameraBodyX = 0; // stroke of the camera body in px
    cameraBodyY = 0; // corner radius of the camera body for all four corners
    cameraBodyS = 2; // x position of the camera body, based on px from ( 0,0 )
    cameraBodyCR = 4; // y position of the camera body, based on px from ( 0,0 )
    cameraBodyW = 293; // width of the camera body
    cameraBodyH = 177; // height of the camera body
    // Camera Accent
    cameraBodyAccentC = accent; // The color of the camera body accent
    cameraBodyAccentX = 0; // stroke of the camera body accent in px
    cameraBodyAccentY = 0; // x position of the camera body accent, based on px from ( 0,0 )
    cameraBodyAccentS = 2; // y position of the camera body accent, based on px from ( 0,0 )
    cameraBodyAccentW = 293; // width of the camera body accent
    cameraBodyAccentH = 102; // height of the camera body accent
  }

  void body(){
    pushMatrix(); // restrict settings to just this instance
    stroke( cameraBodyS );
    fill( cameraBodyC ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( cameraBodyX, cameraBodyY, cameraBodyW, cameraBodyH, cameraBodyCR ); // draw the accent rectangle
    popMatrix();
  }

  void accent(){
    pushMatrix(); // restrict settings to just this instance
    stroke( cameraBodyAccentS );
    fill( cameraBodyAccentC ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( cameraBodyAccentX, cameraBodyAccentY, cameraBodyAccentW, cameraBodyAccentH ); // draw the accent rectangle
    popMatrix();
  }

  void compose(){
    body();
    accent();
  }

}
