// sketch_portland_hipster.pde

//-------------------
// Libraries
//-------------------
import processing.pdf.*;

//-------------------
// Classes
//-------------------
Background background;
CameraBody cameraBody;
Lenses lenses;
Shading shading;
Flash flash;
Buttons buttons;
Crop crop;
Signature signature;

//---------------------------------------------
// Customization Options - Define in setup()
//---------------------------------------------
color optBgColor;
color optBgRectColor;
color optCameraBodyColor;
color optCameraBodyAccentColor;
color optButtonOneColor;
color optButtonTwoColor;
color optLensNineColor;
color optLensEightColor;
color optLensSevenColor;
color optLensSixColor;
color optLensFiveColor;
color optLensFourColor;
color optLensThreeColor;
color optLensTwoColor;
color optLensOneColor;
color optLensHighlightColor;
color optFlashPrimaryColor;
color optFlashHighlightColor;
color optLensGlareColor;
color optCameraBodyShadow;
color optCropColor;
String optSignature;

//----------------
// Setup
//----------------
void setup() {
  //---------------------------
  // Background color options
  //---------------------------
  optBgColor     = color( #ffffff ); // color of the canvas background
  optBgRectColor = color( #29bec5 ); // color of the background rectangle
  // Camera Body color options
  optCameraBodyColor       = color( #f1ecd8 ); // color of the camera body
  optCameraBodyAccentColor = color( #f26333 ); // color of the camera accent (stripe accross the middle)

  //---------------------------
  // Button color options
  //---------------------------
  optButtonOneColor = color( #2e2e2e );
  optButtonTwoColor = color( #2e2e2e );

  //----------------------------------------------------
  // Lens color options, back to front - wide to small
  //----------------------------------------------------
  optLensNineColor  = color( #e4f4f5 );
  optLensEightColor = color( #ffffff );
  optLensSevenColor = color( #0a2632 );
  optLensSixColor   = color( #2abec3 );
  optLensFiveColor  = color( #17a1a3 );
  optLensFourColor  = color( #2abec3 );
  optLensThreeColor = color( #17a1a3 );
  optLensTwoColor   = color( #133559 );
  optLensOneColor   = color( #351616 );
  // Glare/Reflections
  optLensHighlightColor = color( 255, 255, 255, 76); // color of lens reflection color( 0-255, 0-255, 0-255, 0-255 )
  optLensGlareColor = color( #ffffff );

  //------------------------------
  // Flash color options
  //------------------------------

  optFlashPrimaryColor = color( #125079 );
  optFlashHighlightColor = color( 255, 255, 255, 76); // color of flash highlight

  optCameraBodyShadow = color( 0, 0, 0, 76); // color of lens reflection color( 0-255, 0-255, 0-255, 0-255 )

  //----------------------
  // Crop marks
  //----------------------
  optCropColor = color( #000000 ); // color of the crop marks

  //----------------------------------------
  // Signature - Year automatically added
  //----------------------------------------
  optSignature = "Alan McGinnis - "; // signature prefix, YYYY added to end

  //--------------------------------------------------------------
  // Background( background color, background rectangle color )
  //--------------------------------------------------------------
  background = new Background( optBgColor, optBgRectColor );

  //--------------------------------------------------------------
  // CameraBody( camera body color, camera body accent color  )
  //--------------------------------------------------------------
  cameraBody = new CameraBody( optCameraBodyColor, optCameraBodyAccentColor  );

  //--------------------------------------------------------------
  // Lenses( colors l9-l1, back to front - wide to small )
  //--------------------------------------------------------------
  lenses = new Lenses( optLensNineColor, optLensEightColor, optLensSevenColor, optLensSixColor, optLensFiveColor, optLensFourColor, optLensThreeColor, optLensTwoColor, optLensOneColor );

  //-------------------------------------------------------------------------------------------------------------
  // Shading( color - primary lens reflection, color flash reflection, color - both lens glares, body shadow )
  //-------------------------------------------------------------------------------------------------------------
  shading = new Shading( optLensHighlightColor, optFlashHighlightColor, optLensGlareColor, optCameraBodyShadow );

  //-------------------------------------
  // Flash( flash primary color)
  //-------------------------------------
  flash = new Flash( optFlashPrimaryColor );

  //--------------------------------------------
  // Buttons( button 1 color, button one inner color, button 2 color )
  //--------------------------------------------
  buttons = new Buttons( optButtonOneColor, optButtonTwoColor );

  //-------------------------------------
  // Crop( crop marks color )
  //-------------------------------------
  crop = new Crop( optCropColor );

  //-----------------------------------
  // Signature( text for signature )
  //-----------------------------------
  signature = new Signature( optSignature );

  //-----------------------------------
  // Settings for initialization
  //-----------------------------------
  size(612,1008); // canvas size in px ( 8.5 in. X 14in. )
  noLoop(); // loop only once
  beginRecord( PDF, "The-Portland-Hipster.pdf" ); // Output information ( PDF, "filenname.pdf" )
}

//-----------------------------------
// Houston we are go for compile
//-----------------------------------
void draw(){
  background.compose();
  buttons.compose();
  cameraBody.compose();
  lenses.compose();
  flash.compose();
  shading.compose();
  crop.compose();
  // set body psuedo stroke
  // lenses.lensOnePsuedoStroke(); // called separately to sit on top layer
  signature.compose();
  endRecord();
}
