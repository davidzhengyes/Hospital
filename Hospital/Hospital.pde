//Global Variables
ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();

PImage img;



Building building = new Building (4,100,600,800);
void setup(){
  //img = loadImage ("yep.jpg");
  size(600,800);
  
  building.drawBuilding();
  
  Patient ss = new Patient (0,0,89, false,false,false,300,800);
  allPatients.add(ss);

}


void draw(){
  if (frameCount%20==0){
    Patient newPatient = new Patient (0,0,int(random(1,100)), false,false,false,300,800);
    allPatients.add(newPatient);
  }
  
  background(210);
  building.drawBuilding();
  for(int i = 0; i < allDoctors.size(); i++){
    allDoctors.get(i).drawDr();
  }
  
  for (int i=0; i<allPatients.size(); i++){
    allPatients.get(i).drawPa();
    allPatients.get(i).patientY-=1;
  }
  
  
}
