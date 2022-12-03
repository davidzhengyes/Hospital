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

public void num_Docotor_Changer(GTextField source, GEvent event) { //_CODE_:num_Doctor:501931:
  
 
  
  if (int(num_Doctor.getText())!=0){
    reset();
    building.numRooms = int(num_Doctor.getText());
  }
  building.createBuilding();
  
  
} //_CODE_:num_Doctor:501931:

public void patient_Influx_Slider(GCustomSlider source, GEvent event) { //_CODE_:patient_Influx:524675:
 
} //_CODE_:patient_Influx:524675:



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
  doctor_Skill = new GCustomSlider(window1, 30, 20, 109, 53, "purple18px");
  doctor_Skill.setShowValue(true);
  doctor_Skill.setShowLimits(true);
  doctor_Skill.setLimits(5, 1, 10);
  doctor_Skill.setStickToTicks(true);
  doctor_Skill.setShowTicks(true);
  doctor_Skill.setNumberFormat(G4P.INTEGER, 0);
  doctor_Skill.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  doctor_Skill.setOpaque(true);
  doctor_Skill.addEventHandler(this, "doctor_Skill_Slider");
  label1 = new GLabel(window1, 30, 0, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Doctor Skill");
  label1.setOpaque(false);
  doctor_Speed = new GCustomSlider(window1, 170, 20, 100, 50, "purple18px");
  doctor_Speed.setShowValue(true);
  doctor_Speed.setShowLimits(true);
  doctor_Speed.setLimits(5, 1, 10);
  doctor_Speed.setNbrTicks(10);
  doctor_Speed.setStickToTicks(true);
  doctor_Speed.setShowTicks(true);
  doctor_Speed.setNumberFormat(G4P.INTEGER, 0);
  doctor_Speed.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  doctor_Speed.setOpaque(true);
  doctor_Speed.addEventHandler(this, "doctor_Speed_Slider");
  label2 = new GLabel(window1, 170, 0, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Doctor Speed");
  label2.setOpaque(false);
  label3 = new GLabel(window1, 310, 0, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Num Doctor");
  label3.setOpaque(false);
  num_Doctor = new GTextField(window1, 300, 20, 120, 50, G4P.SCROLLBARS_NONE);
  num_Doctor.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  num_Doctor.setOpaque(true);
  num_Doctor.addEventHandler(this, "num_Docotor_Changer");
  patient_Influx = new GCustomSlider(window1, 30, 100, 110, 60, "purple18px");
  patient_Influx.setShowValue(true);
  patient_Influx.setShowLimits(true);
  patient_Influx.setLimits(5, 1, 10);
  patient_Influx.setNbrTicks(10);
  patient_Influx.setStickToTicks(true);
  patient_Influx.setShowTicks(true);
  patient_Influx.setNumberFormat(G4P.INTEGER, 0);
  patient_Influx.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  patient_Influx.setOpaque(true);
  patient_Influx.addEventHandler(this, "patient_Influx_Slider");
  label4 = new GLabel(window1, 30, 80, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Patient Influx");
  label4.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GCustomSlider doctor_Skill; 
GLabel label1; 
GCustomSlider doctor_Speed; 
GLabel label2; 
GLabel label3; 
GTextField num_Doctor; 
GCustomSlider patient_Influx; 
GLabel label4; 
