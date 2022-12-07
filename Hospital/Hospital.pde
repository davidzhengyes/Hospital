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
    
    if (allPatients.get(i).searchingLeft==true){
      gridToSearch=leftGrid;
    }
    else{
      gridToSearch=rightGrid;
    }
    
    if (allPatients.get(i).chairIndex==-1){
      for (int g=0; g<gridToSearch.length;g++){
        //if left or right grid [g] is false, make it true, set chair index to g, break loop
        if(gridToSearch[g]==false){
          gridToSearch[g]=true; //WOW UTILIZING POINTER ARRAY HOPE IT WORKS :D
          allPatients.get(i).chairIndex=g;
          break;
        }
      }
    }
    
    allPatients.get(i).updateColor();
    
    
    if(allPatients.get(i).isHealthy == false){//need if here, if patient is not already healed
      allPatients.get(i).drawPa();
      
      allPatients.get(i).timeSinceEntered++;
      
      if (allPatients.get(i).currentDoctor != null){
        
        if (allPatients.get(i).patientY == allPatients.get(i).currentDoctor.yPos){
          //if patient same height as doctor
          if (abs(allPatients.get(i).patientX - allPatients.get(i).currentDoctor.xPos)==15){
            allPatients.get(i).reachedDoctor = true;
          }
          if (allPatients.get(i).patientX < allPatients.get(i).currentDoctor.xPos && allPatients.get(i).reachedDoctor == false){
            allPatients.get(i).patientX++;
          }
          else if (allPatients.get(i).patientX > allPatients.get(i).currentDoctor.xPos && allPatients.get(i).reachedDoctor == false){
            allPatients.get(i).patientX--;
          }
          
          
        }
        else{
          //if not at same height keep going up
          allPatients.get(i).patientY--;
        }
        
      }
      else{ //those who do not have a doctor //edit here more for seating
        if (allPatients.get(i).patientY==700 ){
          if (allPatients.get(i).searchingLeft ==true && allPatients.get(i).patientX!=50+allPatients.get(i).chairIndex*15){
            allPatients.get(i).patientX--;
          }
          else{
            allPatients.get(i).patientX++;
          }
        }
        else{
          allPatients.get(i).patientY--;
        }
      }
    }
    else if(allPatients.get(i).isHealthy == true){
      allPatients.get(i).drawPa();
      if (allPatients.get(i).patientX != building.pathWidth/2 + building.xWidth){
        if (allPatients.get(i).patientX < allPatients.get(i).currentDoctor.xPos && allPatients.get(i).reachedDoctor == true){
          allPatients.get(i).patientX--;
        }
        else if (allPatients.get(i).patientX > allPatients.get(i).currentDoctor.xPos && allPatients.get(i).reachedDoctor == true){
          allPatients.get(i).patientX++;
        }
      }
      else{
       allPatients.get(i).patientY--; 
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
  loop();
}
