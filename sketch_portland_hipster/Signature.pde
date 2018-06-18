// Signature.pde

class Signature{
  PFont f;
  String signature;
  int year;
  Signature( String optSignature ){
    f = createFont("FiraCode-Regular", 12);
    signature = optSignature;
    year = year();
  }
  void signature(){
    textFont(f);
    text( signature + year, 298, 629 );
  }
  void compose(){
    signature();
  }
}
