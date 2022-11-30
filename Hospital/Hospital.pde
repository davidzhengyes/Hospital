int x = 50;
int y = 100;

ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();


void setup(){
  size(600,800);
  Building building = new Building (4,100);
  building.drawBuilding();
}


void draw(){
  addDr();
  
  for(int i = 0; i < allDoctors.size(); i++){
    allDoctors.get(0).drawDr();
  }
  x += 15;
  
}

void addDr(){
  allDoctors.add(new Doctor(5, 5));
}
