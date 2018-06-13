// sketch_camera_one.pde

// Libraries
import processing.pdf.*;

// Classes
Background background;
CameraBody cameraBody;
Lenses lenses;
Shading shading;
Flash flash;
Buttons buttons;
Crop crop;

// Customization Options - Define in setup()
color optBgC;
color optBgRectC;
color optCameraBodyC;
color optCameraBodyAccentC;
color optButtonOneC;
color optButtonTwoC;
color optLensSevenC;
color optLensSixC;
color optLensFiveC;
color optLensFourC;
color optLensThreeC;
color optLensTwoC;
color optLensOneC;
color optLensHighlightC;
color optFlashPrimaryC;
color optFlashHighlightC;
color optLensGlareC;
color optCameraBodyShadow;
color optCropC;

// Setup
void setup() {
  // Background color options
  optBgC = color( #ffffff ); // color of the canvas background
  optBgRectC = color( #50c2ba ); // color of the background rectangle
  // Camera Body color options
  optCameraBodyC = color( #fffbe4 ); // color of the camera body
  optCameraBodyAccentC = color( #f2634c ); // color of the camera accent (stripe accross the middle)
  // Button color options
  optButtonOneC = color( #353230 );
  optButtonTwoC = color( #353230 );
  // Lens color options, back to front - wide to small
  optLensSevenC = color( #b6b7b9 ); // color of lens 7
  optLensSixC = color( #fef8fb ); // color of lens 6
  optLensFiveC = color( #261224 ); // color of lens 5
  optLensFourC = color( #4fc2ba ); // color of lens 4
  optLensThreeC = color( #309f90 ); // color of lens 3
  optLensTwoC = color( #0d282c ); // color of lens 2
  optLensOneC = color( #261224 ); // color of lens 1
  // Shading/Glare color options
  optLensHighlightC = color( 255, 255, 255, 76); // color of lens reflection color( 0-255, 0-255, 0-255, 0-255 )
  optFlashPrimaryC = ( #152b41 );
  optFlashHighlightC = color( #309f90 ); // color of flash highlight
  optLensGlareC = color( #ffffff );
  optCameraBodyShadow = color( 0, 0, 0, 76); // color of lens reflection color( 0-255, 0-255, 0-255, 0-255 )
  // Crop marks
  optCropC = ( #000000 );


  size(612,1008); // canvas size in px ( 8.5 in. X 14in. )
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
void draw(){
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
