void waveSetup() {
  w = width - 205;
  yvalues = new float[w];
}

//makes the sin wave based off of the amplitude and frequency
void createWave(){
  stroke(255);
  theta = 0.0;
  x = 0;
  for(float i = 205; i < (width); i++){
     x++;
     preY = y;
     y = amplitude * sin(radians(x * (TWO_PI / frequency)));
     point(i, y + height/2);
     point(i, y + height/2 + 1);
  }
}

//
void createMovingWave() {
  stroke(255);
  
  dx = (TWO_PI / frequency);
  theta += 1;
  
  float X = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(radians(X))*amplitude;
    X+=dx;
  }
  
  for (int j = 0; j < yvalues.length; j++) {
    point(j + 205, height/2+yvalues[j]);
    point(j + 205, height/2+yvalues[j] + 1);
  }
}

//makes and labels the axis of the chart
void createChart() {
  stroke(255);
  //y-axis
  line(205, 5, 205, height - 5);
  text("Y", 210, height - 5);
  
  //x-axis
  line(205, height / 2, width, height / 2);
  text("X", width - 12, (height / 2) - 5);
}

//Reset the wave data to default
void reset() {
  txtA.setText("124");
  txtT.setText("0.2");
  txtV.setText("300000000");
  txtf.setText("5");
  txtLambda.setText("60000000");
  updateValues();
}

void updateValues() {
  //Update the values that were given
  if(!Float.isNaN(float(txtA.getText()))) {
    println("Amplitude updated");
    amplitude = float(txtA.getText());
    preA.setText("" + amplitude);
    txtA.setText("");
    updateA = true;
  }
  if(!Float.isNaN(float(txtf.getText()))) {
    println("Frequency updated");
    frequency = float(txtf.getText());
    pref.setText("" + frequency);
    txtf.setText("");
    updatef = true;
  }
  if(!Float.isNaN(float(txtLambda.getText()))) {
    println("Wavelength updated");
    wavelength = float(txtLambda.getText());
    preLambda.setText("" + wavelength);
    txtLambda.setText("");
    updateLambda = true;
  }
  if(!Float.isNaN(float(txtT.getText()))) {
    println("Period updated");
    period = float(txtT.getText());
    preT.setText("" + period);
    txtT.setText("");
    updateT = true;
  }
  if(!Float.isNaN(float(txtV.getText()))) {
    println("Velocity updated");
    velocity = float(txtV.getText());
    preV.setText("" + velocity);
    txtV.setText("");
    updateV = true;
  }
  
  //use medium selectors 
  if(different.isSelected()) {
    updatef = true;
    println("Different mediums selected");
  }
  if(same.isSelected()) {
    updateV = true;
    println("Same medium selected");
  }
  
  //Find values of data that was not given
  if(updateA == false) {
    //Cannot be calculated with the other data
  }
  if(updatef == false) {
    if(updateT == true) {
      frequency = 1 / period;
      updatef = true;
      println("Frequency calculated w/ Period " + frequency);
      pref.setText("" + frequency);
    } else if(updateLambda == true && updateV == true) {
      frequency = velocity / wavelength; 
      updatef = true;
      println("Frequency calculated w/ Wavelength and Velocity " + frequency);
      pref.setText("" + frequency);
    }
  }
  if(updateLambda == false) {
    if(updatef == true && updateV == true) {
      wavelength = velocity/frequency;
      updateLambda = true;
      println("Wavelength calculated w/ Frequency and Velocity " + wavelength);
      preLambda.setText("" + wavelength);
    }
  }
  if(updateT == false) {
    if(updatef == true) {
      period = 1 / frequency;
      updateT = true;
      println("Period calculated w/ Frequency " + period);
      preT.setText("" + period);
    }
  }
  if(updateV == false) {
    if(updatef == true && updateLambda == true) {
      velocity = frequency * wavelength;
      updateV = true;
      println("Velocity calculated w/ Frequency and Wavelength " + velocity);
      preV.setText("" + velocity);
    }
  }
  
  //Reset the update values
  updateLambda = false;
  updateT = false; 
  updateV = false; 
  updateA = false; 
  updatef = false;
}
