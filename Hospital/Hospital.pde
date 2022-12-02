//Global Variables
ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();
import g4p_controls.*;
PImage img;



Building building = new Building (20,100,600,800,50);
void setup(){
  //img = loadImage ("yep.jpg");
  size(600,800);
  
 
  
  Patient ss = new Patient (0,0,89, false,false,false,300,800);
  allPatients.add(ss);
  createGUI();
  building.createBuilding();

}


void draw(){
  if (frameCount%20==0){
    Patient newPatient = new Patient (0,0,int(random(1,100)), false,false,false,300,800);
    allPatients.add(newPatient);
  }
  
  background(210);
  building.drawBuilding();
  for(int i = 0; i < allDoctors.size(); i++){ 
    
    //randomly assigning patients to doctors;
    allDoctors.get(i).drawDr();
    if (allDoctors.get(i).currentPatient == null){
      
      Patient currPat = allPatients.get(int(random(allPatients.size())));
      currPat.currentDoctor = allDoctors.get(i);
      allDoctors.get(i).currentPatient = currPat;
      //print(allDoctors.get(i).currentPatient.patientX);
      
    }
  }
  
  
  for (int i=0; i<allPatients.size(); i++){
    //need if here, if patient is not already healed
    allPatients.get(i).drawPa();
    
    allPatients.get(i).timeSinceEntered++;
    
    if (allPatients.get(i).currentDoctor != null){
      
      
    }
    else{
      allPatients.get(i).patientY-=1;
    }
  }
  
  
}
