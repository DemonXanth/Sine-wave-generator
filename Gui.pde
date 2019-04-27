void guiSetup() {
  G4P.setGlobalColorScheme(GCScheme.GOLD_SCHEME);
  
  //Amplitude textbox and label
  lblA = new GLabel(this, guiX2, 5, guiWidth, guiHeight);
  lblA.setText("Amplitude");
  txtA = new GTextField(this, guiX2, lblA.getY() + 20, guiWidth, guiHeight);
  txtA.tag = "txtA";
  
  //Frequency textbox and label
  lblf = new GLabel(this, guiX2, txtA.getY() + 25, guiWidth, guiHeight);
  lblf.setText("Frequency");
  txtf = new GTextField(this, guiX2, lblf.getY() + 20, guiWidth, guiHeight);
  txtf.tag = "txtf";
  
  //Period textbox and label
  lblT = new GLabel(this, guiX2, txtf.getY() + 25, guiWidth, guiHeight);
  lblT.setText("Period");
  txtT = new GTextField(this, guiX2, lblT.getY() + 20, guiWidth, guiHeight);
  txtT.tag = "txtT";
  
  //Wavelength textbox and label
  lblLambda = new GLabel(this, guiX2, txtT.getY() + 25, guiWidth, guiHeight);
  lblLambda.setText("Wavelength");
  txtLambda = new GTextField(this, guiX2, lblLambda.getY() + 20, guiWidth, guiHeight);
  txtLambda.tag = "txtLambda";
  
  //Velocity textbox and label
  lblV = new GLabel(this, guiX2, txtLambda.getY() + 25, guiWidth, guiHeight);
  lblV.setText("Velocity");
  txtV = new GTextField(this, guiX2, lblV.getY() + 20, guiWidth, guiHeight);
  txtV.tag = "txtV";
  
  //Reset button
  reset = new GButton(this, guiX2, txtV.getY() + 30, guiWidth, guiHeight + 10, "Reset");
  reset.tag = "reset";
  
  //Update button
  update = new GButton(this, guiX2, reset.getY() + 40, guiWidth, guiHeight + 10, "Update");
  update.tag = "update";
  
  //Current value labels
  preTitle = new GLabel(this, guiX1, 5, guiWidth, guiHeight);
  preTitle.setText("Current");
  preA = new GLabel(this, guiX1, txtA.getY(), guiWidth, guiHeight);
  preA.setText("" + amplitude);
  pref = new GLabel(this, guiX1, txtf.getY(), guiWidth, guiHeight);
  pref.setText("" + frequency);
  preT = new GLabel(this, guiX1, txtT.getY(), guiWidth, guiHeight);
  preT.setText("" + period);
  preLambda = new GLabel(this, guiX1, txtLambda.getY(), guiWidth, guiHeight);
  preLambda.setText("" + wavelength);
  preV = new GLabel(this, guiX1, txtV.getY(), guiWidth, guiHeight);
  preV.setText("" + velocity);
  
  //Radio buttons for medium change
  same = new GOption(this, guiX1, reset.getY(), guiWidth, guiHeight + 3, "Same Medium");
  same.tag = "Same";
  different = new GOption(this, guiX1, same.getY() + 25, guiWidth, guiHeight + 3, "Different Medium");
  different.tag = "Different";
  mediums = new GToggleGroup();
  mediums.addControls(same, different);
  same.setSelected(true);
  
  //Checkbox to make wave move
  moving = new GCheckbox(this, guiX1, different.getY() + 25, guiWidth, guiHeight, "Move");
  moving.tag = "Moving";
  moving.setSelected(false);
}

public void displayEvent(String name, GEvent event) {
  String extra = " event fired at " + millis() / 1000.0 + "s";
  print(name + "   ");
  switch(event) {
  case CHANGED:
    println("CHANGED " + extra);
    break;
  case SELECTION_CHANGED:
    println("SELECTION_CHANGED " + extra);
    break;
  case LOST_FOCUS:
    println("LOST_FOCUS " + extra);
    break;
  case GETS_FOCUS:
    println("GETS_FOCUS " + extra);
    break;
  case ENTERED:
    println("ENTERED " + extra);  
    break;
  case SELECTED:
    println("SELECTED " + extra);
    break;
  case DESELECTED:
    println("DESELECTED " + extra);
    break;
  case PRESSED:
    println("PRESSED " + extra);
    break;
  case RELEASED:
    println("RELEASED " + extra);
    break;
  case CLICKED:
    println("CLICKED " + extra);
    break;
  default:
    println("UNKNOWN " + extra);
  }
}

public void handleTextEvents(GEditableTextControl textControl, GEvent event) { 
  displayEvent(textControl.tag, event);
}

void handleButtonEvents(GButton button, GEvent event) {
  displayEvent(button.tag, event);
  if(button == reset) {
    reset();
  } else if(button == update) {
    updateValues();
  }
}

void handleToggleControlEvents(GToggleControl toggleControl, GEvent event) {
  displayEvent(toggleControl.tag, event);
}
