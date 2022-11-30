//Global Variables
ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();


void setup(){
  size(600,800);
  Building building = new Building (4,100);
  building.drawBuilding();
}


void draw(){
  for(int i = 0; i < allDoctors.size(); i++){
    allDoctors.get(i).drawDr();
  }
  
}
