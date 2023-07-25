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
  } else if (wavelength >= 645 && wavelength <= 750) {
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
int roundWavelength(int wavelength) {
  if (wavelength >= 380 && wavelength < 440) {
    // Violet
    return 400;
  } else if (wavelength >= 440 && wavelength < 490) {
    // Blue
    return 450;
  } else if (wavelength >= 490 && wavelength < 510) {
    // Cyan
    return 500;
  } else if (wavelength >= 510 && wavelength < 580) {
    // Green
    return 550;
  } else if (wavelength >= 580 && wavelength < 645) {
    // Yellow
    return 600;
  } else if (wavelength >= 645 && wavelength <= 750) {
    // Red
    return 700;
  } else {
    // Black
    return 0;
  }
}
int RGBToRoundWavelength(float r, float g, float b) {
  if(r > 230 && g > 230 && b > 230){
    // White
    return 0;
  }
  if(g < 25 && b > 230){
    // Violet
    return 400;
  } else if (r < 25 && b > 230) {
    // Blue
    return 450;
  } else if (r < 25 && g > 230) {
    // Cyan
    return 500;
  } else if (g > 230 && b < 25) {
    // Green
    return 550;
  } else if (r < 25 && g != 0 && b < 25) {
    // Yellow
    return 600;
  } else if (r < 25 && g < 25 && b < 25) {
    // Red
    return 700;
  } else {
    // Black
    return -1;
  }
}
