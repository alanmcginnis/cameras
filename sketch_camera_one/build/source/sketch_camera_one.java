import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_camera_one extends PApplet {

// sketch_camera_one.pde

// Libraries


// Classes
Background background;
CameraBody cameraBody;
Lenses lenses;
Shading shading;
Flash flash;
Buttons buttons;
Crop crop;

// Customization Options - Define in setup()
int optBgC;
int optBgRectC;
int optCameraBodyC;
int optCameraBodyAccentC;
int optButtonOneC;
int optButtonTwoC;
int optLensSevenC;
int optLensSixC;
int optLensFiveC;
int optLensFourC;
int optLensThreeC;
int optLensTwoC;
int optLensOneC;
int optLensHighlightC;
int optFlashPrimaryC;
int optFlashHighlightC;
int optLensGlareC;
int optCameraBodyShadow;
int optCropC;

// Setup
public void setup() {
  // Background color options
  optBgC = color( 0xffffffff ); // color of the canvas background
  optBgRectC = color( 0xff50c2ba ); // color of the background rectangle
  // Camera Body color options
  optCameraBodyC = color( 0xfffffbe4 ); // color of the camera body
  optCameraBodyAccentC = color( 0xfff2634c ); // color of the camera accent (stripe accross the middle)
  // Button color options
  optButtonOneC = color( 0xff353230 );
  optButtonTwoC = color( 0xff353230 );
  // Lens color options, back to front - wide to small
  optLensSevenC = color( 0xffb6b7b9 ); // color of lens 7
  optLensSixC = color( 0xfffef8fb ); // color of lens 6
  optLensFiveC = color( 0xff261224 ); // color of lens 5
  optLensFourC = color( 0xff4fc2ba ); // color of lens 4
  optLensThreeC = color( 0xff309f90 ); // color of lens 3
  optLensTwoC = color( 0xff0d282c ); // color of lens 2
  optLensOneC = color( 0xff261224 ); // color of lens 1
  // Shading/Glare color options
  optLensHighlightC = color( 255, 255, 255, 76); // color of lens reflection color( 0-255, 0-255, 0-255, 0-255 )
  optFlashPrimaryC = ( 0xff152b41 );
  optFlashHighlightC = color( 0xff309f90 ); // color of flash highlight
  optLensGlareC = color( 0xffffffff );
  optCameraBodyShadow = color( 0, 0, 0, 76); // color of lens reflection color( 0-255, 0-255, 0-255, 0-255 )
  // Crop marks
  optCropC = ( 0xff000000 );


   // canvas size in px ( 8.5 in. X 14in. )
  noLoop(); // loop only once
  // Background( background color, background rectangle color )
  background = new Background( optBgC, optBgRectC );
  // CameraBody( camera body color, camera body accent color  )
  cameraBody = new CameraBody( optCameraBodyC, optCameraBodyAccentC  );
  // Lenses( colors l7-l1, back to front - wide to small )
  lenses = new Lenses( optLensSevenC, optLensSixC, optLensFiveC, optLensFourC, optLensThreeC, optLensTwoC, optLensOneC );
  // Shading( color - primary lens reflection, color flash reflection, color - both lens glares, body shadow )
  shading = new Shading( optLensHighlightC, optFlashHighlightC, optLensGlareC, optCameraBodyShadow );
  // Flash( flash primary color)
  flash = new Flash( optFlashPrimaryC );
  buttons = new Buttons( optButtonOneC, optButtonTwoC );
  // Crop()
  crop = new Crop( optCropC );
  beginRecord( PDF, "cameraOne.pdf" );
}

// Houston we are go for compile
public void draw(){
  background.compose();
  buttons.compose();
  cameraBody.compose();
  lenses.compose();
  flash.compose();
  shading.compose();
  crop.compose();
  // set body psuedo stroke
  lenses.lensOnePsuedoStroke(); // called separately to sit on top layer
  endRecord();
}
// Background.pde

class Background{

  // background modifiers
  int bgC;
  // rotated rectangle coordinates
  int bgAccRectX;
  int bgAccRectY;
  // rotated rectangle dimensions
  int bgAccRectW;
  int bgAccRectH;
  // rotated rectangle modifiers
  int bgAccRectDeg;
  int bgAccRectC;

  Background(int background, int accent){
    bgC = background; // The color of the canvas
    bgAccRectC = accent ; // The color of the rotated rectangle
    bgAccRectX = 0; // x position of the rotated rectangle, based on px from ( 0,0 )
    bgAccRectY = 0; // y position of the rotated rectangle, based on px from ( 0,0 )
    bgAccRectW = 673; // The width of the rotated rectangle in px
    bgAccRectH = 386; // The height of the rotated rectangle in px
    bgAccRectDeg = 315; // The angle of the rotated rectangle in deg out of 360
  }

  public void compose(){
    pushMatrix(); // restrict settings to just this instance
    background( bgC ); // color of the background
    noStroke(); // no outline
    fill( bgAccRectC ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rotate( radians( bgAccRectDeg ) ); // rotate the accent rectangle
    rect( bgAccRectX, bgAccRectY, bgAccRectW, bgAccRectH ); // draw the accent rectangle
    popMatrix();
  }

}
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
  int buttonOneC;
  // button two coordinates
  int buttonTwoX;
  int buttonTwoY;
  // button two dimensions
  int buttonTwoW;
  int buttonTwoH;
  // button two modifiers
  int buttonTwoS;
  int buttonTwoC;

  Buttons( int buttonOne, int buttonTwo ){
    buttonOneX = 54; // x position of the button one, based on px from ( 0,0 )
    buttonOneY = -90; //  y position of the button one, based on px from ( 0,0 )
    buttonOneW = 34; // width of the button one
    buttonOneH = 14; // height of the button one
    buttonOneS = 2; // stroke of the button one
    buttonOneC = buttonOne; // color of button one
    buttonTwoX = 103; // x position of the button two, based on px from ( 0,0 )
    buttonTwoY = -90; //  y position of the button two, based on px from ( 0,0 )
    buttonTwoW = 43; // width of the button two
    buttonTwoH = 14; // height of the button two
    buttonTwoS = 2; // stroke of the button two
    buttonTwoC = buttonTwo; // color of button two
  }

  public void buttonOne(){
    pushMatrix(); // restrict settings to just this instance
    stroke( buttonOneS ); // stroke width for button one
    fill( buttonOneC ); // set the color of button one
    rectMode( CENTER ); // set axis to center point of button one
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( buttonOneX, buttonOneY, buttonOneW, buttonOneH ); // draw button one
    popMatrix();
  }

  public void buttonTwo(){
    pushMatrix(); // restrict settings to just this instance
    stroke( buttonTwoS ); // stroke witdth for button two
    fill( buttonTwoC ); // set the color of button two
    rectMode( CENTER ); // set axis to center point of button two
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( buttonTwoX, buttonTwoY, buttonTwoW, buttonTwoH ); // draw button two
    popMatrix();
  }

  public void compose(){
    buttonOne();
    buttonTwo();
  }

}
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
  int cameraBodyC;
  int cameraBodyAccentC;

  // camera body accent coordinates
  int cameraBodyAccentX;
  int cameraBodyAccentY;
  // camera body accent dimensions
  int cameraBodyAccentW;
  int cameraBodyAccentH;
  // camera body accent modifiers
  int cameraBodyAccentS;


  CameraBody( int body, int accent ){
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

  public void body(){
    pushMatrix(); // restrict settings to just this instance
    stroke( cameraBodyS );
    fill( cameraBodyC ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( cameraBodyX, cameraBodyY, cameraBodyW, cameraBodyH, cameraBodyCR ); // draw the accent rectangle
    popMatrix();
  }

  public void accent(){
    pushMatrix(); // restrict settings to just this instance
    stroke( cameraBodyAccentS );
    fill( cameraBodyAccentC ); // set the color of the accent rectangle
    rectMode( CENTER ); // set axis to center point of the rectangle
    translate( width/2, height/2 ); // 50% of canvas with and height for easier centering on canvas
    rect( cameraBodyAccentX, cameraBodyAccentY, cameraBodyAccentW, cameraBodyAccentH ); // draw the accent rectangle
    popMatrix();
  }

  public void compose(){
    body();
    accent();
  }

}
// Crop.pde

class Crop{
  // global crop dimensions
  float cropGlobalVertW;
  int cropGlobalVertH;
  int cropGlobalHorzW;
  float cropGlobalHorzH;
  // upper left crop marks coordinates
  int upperLeftCropVertX;
  int upperLeftCropVertY;
  int upperLeftCropHorzX;
  int upperLeftCropHorzY;
  // upper right crop marks coordinates
  int upperRightCropVertX;
  int upperRightCropVertY;
  int upperRightCropHorzX;
  int upperRightCropHorzY;
  // lower left crop marks coordinates
  int lowerLeftCropVertX;
  int lowerLeftCropVertY;
  int lowerLeftCropHorzX;
  int lowerLeftCropHorzY;
  // lower right crop marks coordinates
  int lowerRightCropVertX;
  int lowerRightCropVertY;
  int lowerRightCropHorzX;
  int lowerRightCropHorzY;
  // Crop mark modifiers
  int cropC;

  Crop( int crop ){
    cropGlobalVertW = 0.3f; // crop mark width for vertical marks
    cropGlobalVertH = 36; // crop mark height for vertical marks
    cropGlobalHorzW = 36; // crop mark width for horizontal marks
    cropGlobalHorzH = 0.3f; // crop mark height for horizontal marks
    upperLeftCropVertX = -180; // x position for upper left vertical crop mark
    upperLeftCropVertY = -216; // y position for upper left vertical crop mark
    upperLeftCropHorzX = -216; // x position for upper left horizontal crop mark
    upperLeftCropHorzY = -180; // y position for upper left horizontal crop mark
    upperRightCropVertX = 180; // x position for upper right vertical crop mark
    upperRightCropVertY = -216; // y position for upper right vertical crop mark
    upperRightCropHorzX = 216; // x position for upper right horizontal crop mark
    upperRightCropHorzY = -180; // y position for upper right horizontal crop mark
    lowerLeftCropVertX = -180; // x position for lower left vertical crop mark
    lowerLeftCropVertY = 216; // y position for lower left vertical crop mark
    lowerLeftCropHorzX = -216; // x position for lower left horizontal crop mark
    lowerLeftCropHorzY = 180; // y position for lower left horizontal crop mark
    lowerRightCropVertX = 180; // x position for lower right vertical crop mark
    lowerRightCropVertY = 216; // y position for lower right vertical crop mark
    lowerRightCropHorzX = 216; // x position for lower right horizontal crop mark
    lowerRightCropHorzY = 180; // y position for lower right horizontal crop mark
    cropC = crop; // color for all of the crop marks
  }

  public void upperLeftVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperLeftCropVertX, upperLeftCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  public void upperLeftHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperLeftCropHorzX, upperLeftCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  public void upperRightVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperRightCropVertX, upperRightCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  public void upperRightHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperRightCropHorzX, upperRightCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  public void lowerLeftVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerLeftCropVertX, lowerLeftCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  public void lowerLeftHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerLeftCropHorzX, lowerLeftCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  public void lowerRightVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerRightCropVertX, lowerRightCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  public void lowerRightHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerRightCropHorzX, lowerRightCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  public void compose(){
    upperLeftVertCrop();
    upperLeftHorzCrop();
    upperRightVertCrop();
    upperRightHorzCrop();
    lowerLeftVertCrop();
    lowerLeftHorzCrop();
    lowerRightVertCrop();
    lowerRightHorzCrop();
  }

}
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
  int flashC;

  Flash( int primary ){
    flashX = -110; // x position of the flash, based on px from ( 0,0 )
    flashY = -71; //  y position of the flash, based on px from ( 0,0 )
    flashW = 48; // width of the flash
    flashH = 22; // height of the flash
    flashBorderW = 50; // width of the flash
    flashBorderH = 24; // height of the flash
    flashC = primary; // color of the flash
  }

  public void flash(){
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

  public void compose(){
    flash();
  }

}
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
  int lensSevenC;
  // lens 6 dimensions
  int lensSixWH;
  // lens 6 modifiers
  int lensSixC;
  // lens 5 dimensions
  int lensFiveWH;
  // lens 5 modifiers
  int lensFiveC;
  // lens 4 dimensions
  int lensFourWH;
  // lens 4 modifiers
  int lensFourC;
  // lens 3 dimensions
  int lensThreeWH;
  // lens 3 modifiers
  int lensThreeC;
  // lens 2 dimensions
  int lensTwoWH;
  // lens 2 modifiers
  int lensTwoC;
  // lens 1 dimensions
  int lensOneWH;
  // lens 1 modifiers
  int lensOneC;

  Lenses( int l7, int l6, int l5, int l4, int l3, int l2, int l1){
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

  public void lensOne(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensOneC );
    // stroke( lensesS );
    ellipse( lensesX, lensesY, lensOneWH,lensOneWH );
    popMatrix();
  }

  public void lensTwo(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensTwoC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensTwoWH,lensTwoWH );
    popMatrix();
  }

  public void lensThree(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensThreeC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensThreeWH,lensThreeWH );
    popMatrix();
  }

  public void lensFour(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensFourC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensFourWH,lensFourWH );
    popMatrix();
  }

  public void lensFive(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensFiveC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensFiveWH,lensFiveWH );
    popMatrix();
  }

  public void lensSix(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensSixC );
    stroke( lensesS );
    ellipse( lensesX, lensesY, lensSixWH,lensSixWH );
    popMatrix();
  }

  public void lensSeven(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    fill( lensSevenC );
    noStroke();
    ellipse( lensesX, lensesY, lensSevenWH,lensSevenWH );
    popMatrix();
  }

  public void lensOnePsuedoStroke(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noFill();
    stroke(lensesS);
    ellipse( lensesX, lensesY, lensOneWH,lensOneWH );
    popMatrix();
  }

  public void compose(){
    lensOne();
    lensTwo();
    lensThree();
    lensFour();
    lensFive();
    lensSix();
    lensSeven();
  }

}
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
  int lensHighlightC;
  // flash highlight coordinates
  int flashHighlightVertOneX;
  int flashHighlightVertOneY;
  int flashHighlightVertTwoX;
  int flashHighlightVertTwoY;
  int flashHighlightVertThreeX;
  int flashHighlightVertThreeY;
  // flash highlight modifiers
  int flashHighlightC;
  // large lens glare coordinates
  int lensGlareLargeX;
  int lensGlareLargeY;
  // large lens glare dimensions
  int lensGlareLargeWH;
  // large lens glare modifiers
  int lensGlareLargeC;
  // small lens glare coordinates
  int lensGlareSmallX;
  int lensGlareSmallY;
  // small lens glare dimensions
  int lensGlareSmallWH;
  // small lens glare modifiers
  int lensGlareSmallC;
  // body shadow coordinates
  int cameraBodyShadowX;
  int cameraBodyShadowY;
  // body shadow dimensions
  int cameraBodyShadowWH;
  // body shadow modifiers
  int cameraBodyShadowC;

  Shading( int lensHighlight, int flashHighlight, int lensGlare, int cameraBodyShadow ){
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

  public void lensHighlight(){
    pushMatrix();
    translate( width/2, height/2 );
    fill( lensHighlightC );
    arc( lensHighlightX, lensHighlightY, lensHighlightWH, lensHighlightWH, lensHighlightStart, lensHighlightEnd, OPEN);
    print(lensHighlightWH);
    popMatrix();
  }

  public void lensGlareLarge(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noStroke();
    fill( lensGlareLargeC );
    ellipse( lensGlareLargeX, lensGlareLargeY, lensGlareLargeWH, lensGlareLargeWH );
    popMatrix();
  }

  public void lensGlareSmall(){
    pushMatrix();
    translate( width/2, height/2 );
    ellipseMode( CENTER );
    noStroke();
    fill( lensGlareSmallC );
    ellipse( lensGlareSmallX, lensGlareSmallY, lensGlareSmallWH, lensGlareSmallWH );
    popMatrix();
  }

  public void flashHighlight(){
    beginShape( TRIANGLES );
    noStroke();
    fill( flashHighlightC );
    vertex( flashHighlightVertOneX, flashHighlightVertOneY );
    vertex( flashHighlightVertTwoX, flashHighlightVertTwoY );
    vertex( flashHighlightVertThreeX, flashHighlightVertThreeY );
    endShape();
  }

  public void compose(){
    lensGlareLarge();
    lensGlareSmall();
    lensHighlight();
    flashHighlight();
  }

}
  public void settings() {  size(612,1008); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_camera_one" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
