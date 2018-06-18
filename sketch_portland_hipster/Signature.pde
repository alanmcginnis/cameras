// Signature.pde

class Signature{
  PFont f;
  String signatureOPT;
  Signature( String signature ){
    f = createFont("FiraCode-Regular", 12);
    signatureOPT = signature;
  }
  void signature(){
    textFont(f);
    text( signatureOPT, 298, 629 );
  }
  void compose(){
    signature();
  }
}
