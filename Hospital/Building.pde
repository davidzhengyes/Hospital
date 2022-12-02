class Building{
  int numRooms;
  int pathWidth;
  
  int xWidth;
  int yWidth;
  
  int doorOffset;
  
  int screenWidth;
  int screenLength;
  
  int doorWidth;
  
  ArrayList <Room> rooms = new ArrayList <Room>();
  
  
  Building(int r,int p,int w, int l, int dw){
    this.numRooms = r;
    this.pathWidth=p;
    this.screenWidth = w;
    this.screenLength = l;
    this.doorWidth=dw;   //please limit doorwidth on GUI to something relative to max rooms :D
    
    this.xWidth = (this.screenWidth-pathWidth)/2;
    this.yWidth = this.screenLength*2/3/(this.numRooms/2+this.numRooms%2);
    
  }
  
  void createBuilding(){
    for (int i=0; i<this.numRooms; i++){
      Room currRoom = new Room();
      currRoom.yPos = i/2*yWidth;
      rooms.add(currRoom);
      
      if (i%2==0){
        currRoom.xPos = 0;
      }
      else{
        currRoom.xPos = width-(width-this.pathWidth)/2;
      }
      
      allDoctors.add(new Doctor((currRoom.xPos+this.xWidth)-(this.xWidth/2), (currRoom.yPos+this.yWidth)-(this.yWidth/2)));
    }
  }
  
  
  void drawBuilding(){
    for (int i=0; i<this.numRooms; i++){
      Room currRoom = rooms.get(i);
      
      
      stroke(0);
      
      if (i%2==0){
        
        line(currRoom.xPos+this.xWidth+1, currRoom.yPos,currRoom.xPos+this.xWidth+1,currRoom.yPos+(this.yWidth-this.doorWidth)/2.0);
        line(currRoom.xPos+this.xWidth+1, currRoom.yPos+(this.yWidth-this.doorWidth)/2.0 + this.doorWidth,currRoom.xPos+this.xWidth+1,currRoom.yPos+this.yWidth);
      }
      else{
        line(currRoom.xPos-1,currRoom.yPos,currRoom.xPos-1,currRoom.yPos+(this.yWidth-this.doorWidth)/2.0);
        line(currRoom.xPos-1,currRoom.yPos+(this.yWidth-this.doorWidth)/2.0+this.doorWidth,currRoom.xPos-1,currRoom.yPos+this.yWidth);
      }
      
      fill(255);
      stroke(255);
      rect(currRoom.xPos, currRoom.yPos, this.xWidth, this.yWidth);
      
      stroke(0);
      line(currRoom.xPos,currRoom.yPos,currRoom.xPos+this.xWidth,currRoom.yPos);
      line(currRoom.xPos ,currRoom.yPos+this.yWidth , currRoom.xPos+this.xWidth ,currRoom.yPos+yWidth);
      
    
      
      
    }
  }
  
}
