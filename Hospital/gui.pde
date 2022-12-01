/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:233619:
  appc.background(230);
} //_CODE_:window1:233619:

public void doctor_Skill_Slider(GCustomSlider source, GEvent event) { //_CODE_:doctor_Skill:394406:
  allDoctors.get(0).doctorSkill = doctor_Skill.getValueF();
} //_CODE_:doctor_Skill:394406:

public void doctor_Speed_Slider(GCustomSlider source, GEvent event) { //_CODE_:doctor_Speed:501818:
  allDoctors.get(0).doctorSpeed = doctor_Speed.getValueF();
} //_CODE_:doctor_Speed:501818:

public void num_Doctor_Slider(GCustomSlider source, GEvent event) { //_CODE_:num_Doctor:954231:
  println("num_Doctor - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:num_Doctor:954231:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 500, 500, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  doctor_Skill = new GCustomSlider(window1, 1, 2, 100, 40, "grey_blue");
  doctor_Skill.setLimits(5.0, 1.0, 10.0);
  doctor_Skill.setNumberFormat(G4P.DECIMAL, 2);
  doctor_Skill.setOpaque(false);
  doctor_Skill.addEventHandler(this, "doctor_Skill_Slider");
  label1 = new GLabel(window1, 1, 1, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Doctor Skill");
  label1.setOpaque(false);
  doctor_Speed = new GCustomSlider(window1, 104, 2, 100, 40, "grey_blue");
  doctor_Speed.setLimits(5.0, 1.0, 10.0);
  doctor_Speed.setNumberFormat(G4P.DECIMAL, 2);
  doctor_Speed.setOpaque(false);
  doctor_Speed.addEventHandler(this, "doctor_Speed_Slider");
  label2 = new GLabel(window1, 104, 0, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Doctor Speed");
  label2.setOpaque(false);
  num_Doctor = new GCustomSlider(window1, 207, 1, 100, 40, "grey_blue");
  num_Doctor.setLimits(0.5, 0.0, 1.0);
  num_Doctor.setNumberFormat(G4P.DECIMAL, 2);
  num_Doctor.setOpaque(false);
  num_Doctor.addEventHandler(this, "num_Doctor_Slider");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GCustomSlider doctor_Skill; 
GLabel label1; 
GCustomSlider doctor_Speed; 
GLabel label2; 
GCustomSlider num_Doctor; 
