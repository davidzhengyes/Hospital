//Global Variables
ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();
import g4p_controls.*;
PImage img;
//s
ChairGrid cgLeft = new ChairGrid(50,666,12);
ChairGrid cgRight = new ChairGrid(370,666,12);
Boolean[] leftGrid = new Boolean[cgLeft.chairNum*2];
Boolean[] rightGrid = new Boolean [cgRight.chairNum*2];


Building building = new Building (4,100,600,800,20);
void setup(){
  //img = loadImage ("yep.jpg");
  size(600,800);
  
 
  
  Patient ss = new Patient (0,0,99, false,false,false,300,700);
  allPatients.add(ss);
  
  createGUI();
  building.createBuilding();
  
  for (int i=0; i<leftGrid.length;i++){
    leftGrid[i]=false;
    rightGrid[i]=false;
  }

}


void draw(){
  
  if (frameCount%20==0){
    Patient newPatient = new Patient (0,0,int(random(1,100)), false,false,false,300,800);
    allPatients.add(newPatient);
  }
  //println(allPatients.get(0).currentDoctor);
  background(210);
  cgLeft.display();
  cgRight.display();
  building.drawBuilding();
  
  //didn't use Doctor doctor:allDoctors as an iterator because of ConcurrentModificationException
  for(int i=0;i<allDoctors.size();i++){ 
    
    //randomly assigning patients to doctors;
    allDoctors.get(i).drawDr();
    if (allDoctors.get(i).currentPatient == null){ //if room is empty
      
      Patient currPat = allPatients.get(int(random(allPatients.size())));
      //pick random patient
      if (currPat.currentDoctor == null){
        currPat.currentDoctor = allDoctors.get(i);
        allDoctors.get(i).currentPatient = currPat;
      //print(doctor.currentPatient.patientX);
      }
    }
    
    else{
      if (allDoctors.get(i).currentPatient.reachedDoctor){
        allDoctors.get(i).healPatient();
      }
    }
  }
  
  //not using Patient patient:allPatients same reason as doctors
  for (int i=0; i<allPatients.size(); i++){
    
    Boolean[] gridToSearch;
    Patient patient = allPatients.get(i);
 
   
    if (patient.chairIndex==0){
      println(patient.patientX);
    }
    
    if(patient.chairIndex==-1 && patient.currentDoctor==null){
      for (int g=0;g<leftGrid.length;g++){
        if (patient.searchingLeft==true){
          if(leftGrid[g]==false){
            
            leftGrid[g]=true; 
            patient.chairIndex=g;
            patient.hasSeat=true;
            break;
          }
        }
        else{
          
        }
      }
    }
    
    patient.updateColor();
    
    
    if(patient.isHealthy == false){//need if here, if patient is not already healed
      patient.drawPa();
      
      patient.timeSinceEntered++;
      
      if (patient.currentDoctor != null){
        
        if (patient.patientY == patient.currentDoctor.yPos){
          //if patient same height as doctor
          if (abs(patient.patientX - patient.currentDoctor.xPos)==15){
            patient.reachedDoctor = true;
          }
          if (patient.patientX < patient.currentDoctor.xPos && patient.reachedDoctor == false){
            patient.patientX++;
          }
          else if (patient.patientX > patient.currentDoctor.xPos && patient.reachedDoctor == false){
            patient.patientX--;
          }
          
          
        }
        else{
          //if not at same height keep going up
          patient.patientY--;
        }
        
      }
      else{ //those who do not have a doctor //edit here more for seating
        if (patient.patientY==700 ){
          if (patient.searchingLeft ==true && patient.patientX>=50+(patient.chairIndex%13)*15){
            patient.patientX--;
          }
          else{
            patient.patientX++;
          }
        }
        else{
          patient.patientY--;
        }
      }
    }
    else if(patient.isHealthy == true){
      patient.drawPa();
      if (patient.patientX != building.pathWidth/2 + building.xWidth){
        if (patient.patientX < patient.currentDoctor.xPos && patient.reachedDoctor == true){
          patient.patientX--;
        }
        else if (patient.patientX > patient.currentDoctor.xPos && patient.reachedDoctor == true){
          patient.patientX++;
        }
      }
      else{
       patient.patientY--; 
      }
    }
  }
}



void reset(){
  noLoop();
  allDoctors = new ArrayList<Doctor>();
  allPatients = new ArrayList<Patient>();
  building.createBuilding();
  allPatients.add(new Patient (0,0,99, false,false,false,300,700));
  
  for (int i=0; i<leftGrid.length;i++){
    leftGrid[i]=false;
    rightGrid[i]=false;
  }
  
  loop();
}
