color wavelenghtToRGB(int wavelength) {
  float r, g, b;
  if (wavelength >= 380 && wavelength < 440) {
    // Violet
    r = (-(wavelength - 440.0) / (440.0 - 380.0))*255.0;
    g = 0.0;
    b = 255.0;
  } else if (wavelength >= 440 && wavelength < 490) {
    // Blue
    r = 0.0;
    g = ((wavelength - 440.0) / (490.0 - 440.0))*255.0;
    b = 255.0;
  } else if (wavelength >= 490 && wavelength < 510) {
    // Cyan
    r = 0.0;
    g = 255.0;
    b = (-(wavelength - 510.0) / (510.0 - 490.0))*255.0;
  } else if (wavelength >= 510 && wavelength < 580) {
    // Green
    r = ((wavelength - 510.0) / (580.0 - 510.0))*255.0;
    g = 255.0;
    b = 0.0;
  } else if (wavelength >= 580 && wavelength < 645) {
    // Yellow
    r = 255.0;
    g = (-(wavelength - 645.0) / (645.0 - 580.0))*255.0;
    b = 0.0;
  } else if (wavelength >= 645 && wavelength < 750) {
    // Red
    r = 255.0;
    g = 0.0;
    b = 0.0;
  } else {
    r = 0.0;
    g = 0.0;
    b = 0.0;
  }
  return color(r, g, b);
}
int wavelengthId(int wavelength) {
  if (wavelength >= 380 && wavelength < 440) {
    // Violet
    return 6;
  } else if (wavelength >= 440 && wavelength < 490) {
    // Blue
    return 5;
  } else if (wavelength >= 490 && wavelength < 510) {
    // Cyan
    return 4;
  } else if (wavelength >= 510 && wavelength < 580) {
    // Green
    return 3;
  } else if (wavelength >= 580 && wavelength < 645) {
    // Yellow
    return 2;
  } else if (wavelength >= 645 && wavelength < 750) {
    // Red
    return 1;
  } else if (wavelength >= 750 && wavelength < 1100) {
    // Infrated
    return 7;
  } else if (wavelength >= 1100 && wavelength < 2010) {
    // Radar
    return 8;
  } else if (wavelength >= -900 && wavelength < 380) {
    // Ultraviolet
    return 9;
  } else {
    // Black
    return -999;
  }
}
int colorToWavelengthId(color a) {
  if(hex(a).equals("FFA349A4")){
    // Violet
    return 6;
  } else if (hex(a).equals("FF3F48CC")) {
    // Blue
    return 5;
  } else if (hex(a).equals("FF00A2E8")) {
    // Cyan
    return 4;
  } else if (hex(a).equals("FF22B14C")) {
    // Green
    return 3;
  } else if (hex(a).equals("FFFFF200")) {
    // Yellow
    return 2;
  } else if (hex(a).equals("FFED1C24")) {
    // Red
    return 1;
  } else if(hex(a).equals("FFFFFFFF")){
    //White
    return 0;
  } else if(hex(a).equals("FF880015")){
    //Infra
    return 7;
  } else if(hex(a).equals("FFC8BFE7")){
    //Radar
    return 8;
  } else if(hex(a).equals("FFFFAEC9")){
    //Ultra
    return 9;
  } else {
    // Black
    return -1;
  }
}
