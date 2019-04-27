import g4p_controls.*;

//Wave variables
float x, y, preY = 0;
float wavelength = 60000000;
float period = 0.2;
float velocity = 300000000;
float amplitude = 124;
float frequency = 5; 
float theta = 0.0; //Angular velocity or Angular frequency
float dx;
float[] yvalues;
int w;

//Data used for calculating other values
boolean updateLambda, updateT, updateV, updateA, updatef = true;

//GUI variables
GTextField txtLambda, txtT, txtV, txtA, txtf; //text boxes
GLabel lblLambda, lblT, lblV, lblA, lblf; //text box labels
GLabel preTitle, preLambda, preT, preV, preA, pref; //current values
GButton reset, update; //reset and update buttons
GOption same, different; //options to select same or different mediums
GToggleGroup mediums;
GCheckbox moving; //option to have the wave move across the screen

//General location and dimensions values for GUI
float guiX1 = 105;
float guiX2 = 5;
float guiWidth = 95;
float guiHeight = 20;
 
void setup() {
  size(800, 310);
  stroke(255);
  
  guiSetup();
  waveSetup();
}
 
void draw() {
  background(0);
  if(moving.isSelected()) {
    createMovingWave();
  } else {
    createWave();
  }
  createChart();
}
