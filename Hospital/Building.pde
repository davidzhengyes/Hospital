class Building{
  int numRooms;
  int pathWidth;
  
  int xWidth;
  int yWidth;
  
  int doorOffset;
  
  int screenWidth;
  int screenLength;
  
  ArrayList rooms = new ArrayList <Room>();
  
  
  Building(int rooms,int p,int w, int l){
    this.numRooms = rooms;
    this.pathWidth=p;
    this.screenWidth = w;
    this.screenLength = l;
    
    this.xWidth = (this.screenWidth-pathWidth)/2;
    this.yWidth = this.screenLength*2/3/(this.numRooms/2+this.numRooms%2);
    
  }
  
  
  void drawBuilding(){
    for (int i=0; i<this.numRooms; i++){
      
      Room currRoom = new Room();
      currRoom.yPos = i/2*yWidth;
      rooms.add(currRoom);
      if (i%2==0){
        currRoom.xPos=0;
      }
      else{
        currRoom.xPos = width-(width-this.pathWidth)/2;
      }
      fill(255);
      rect(currRoom.xPos, currRoom.yPos, this.xWidth, this.yWidth);
     
      
      allDoctors.add(new Doctor((currRoom.xPos+this.xWidth)-(this.xWidth/2), (currRoom.yPos+this.yWidth)-(this.yWidth/2)));
    }
  }
  
}
