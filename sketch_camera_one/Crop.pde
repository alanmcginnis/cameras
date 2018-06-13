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
  color cropC;

  Crop( color crop ){
    cropGlobalVertW = 0.3; // crop mark width for vertical marks
    cropGlobalVertH = 36; // crop mark height for vertical marks
    cropGlobalHorzW = 36; // crop mark width for horizontal marks
    cropGlobalHorzH = 0.3; // crop mark height for horizontal marks
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

  void upperLeftVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperLeftCropVertX, upperLeftCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  void upperLeftHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperLeftCropHorzX, upperLeftCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  void upperRightVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperRightCropVertX, upperRightCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  void upperRightHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( upperRightCropHorzX, upperRightCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  void lowerLeftVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerLeftCropVertX, lowerLeftCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  void lowerLeftHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerLeftCropHorzX, lowerLeftCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  void lowerRightVertCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerRightCropVertX, lowerRightCropVertY, cropGlobalVertW, cropGlobalVertH );
    popMatrix();
  }

  void lowerRightHorzCrop(){
    pushMatrix();
    noStroke();
    rectMode( CENTER );
    translate( width/2, height/2 );
    fill( cropC );
    rect( lowerRightCropHorzX, lowerRightCropHorzY, cropGlobalHorzW, cropGlobalHorzH );
    popMatrix();
  }

  void compose(){
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
