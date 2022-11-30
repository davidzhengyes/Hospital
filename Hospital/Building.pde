class Building{
  int numRooms;
  int pathWidth;
  
  int xWidth;
  int yWidth;
  
  int doorOffset;
  
  ArrayList rooms = new ArrayList <Room>();
  
  
  Building(int rooms,int p){
    this.numRooms = rooms;
    this.pathWidth=p;
    this.xWidth = (width-pathWidth)/2;
    this.yWidth = height*2/3/(this.numRooms/2+this.numRooms%2);
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
      rect(currRoom.xPos, currRoom.yPos, this.xWidth, this.yWidth);
      println(currRoom.xPos, currRoom.yPos, this.xWidth,this.yWidth);
    }
  }
  
}
