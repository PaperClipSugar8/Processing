

HashMap<Integer, Integer[]> nodes;
int rec;
boolean is;
boolean RUNNING;
int len = 900;
int time;
int[] antX;
int numIter;


Queen antColony;

void setup(){
  size(900, 900);
  frameRate(30.0);
  nodes = new HashMap<Integer, Integer[]>();
  rec = 0;
  is = true;
  RUNNING = false;
  time = 0;
  numIter = 0;
}

void draw(){
  background(0);
  strokeWeight(2);
  stroke(255);
  noFill();
  
  if (RUNNING){
    if (time%10 ==  0 && numIter < 50){

      //lanuch ant
      antX = antColony.antPath();
      System.out.print("selected path >>> ");
      for (int i=0; i<antX.length; i++){
        System.out.print(antX[i] + " > ");
      }
      System.out.println("Total cost: " + antColony.totalCost(antX));
  
      // update Pheromone matrix
      antColony.updatePheromone(antX);
   
      // update probability distribution
      antColony.updateProbDB();
      
      // put ant's path in pathWays
      antColony.pathWays.put(numIter, antX);
    // numIter add one
      numIter++;

    }
    
    // draws the path of the ant
    push();
    strokeWeight(4);
    stroke(255, 255, 255, 80);
    antColony.drawPath(antX);
    pop();
    
    // display the total cost
    push();
    stroke(255, 255, 255, 200);
    strokeWeight(3);
    textSize(30);
    text("Total cost: " + antColony.totalCost(antX), len - 350, len - 160);
    pop();
    
    // display best path
    push();
    stroke(255, 255, 255, 255);
    strokeWeight(5);
    antColony.drawPath(antColony.getBestPath());
    stroke(255, 255, 255, 255);
    strokeWeight(5);
    textSize(30);
    text("Best: " + antColony.totalCost(antColony.getBestPath()), len - 600, len - 160);
    pop();
    
  }
  
  
  
  
  // draw all the nodes
  push();
  fill(255, 255, 255, 100);
  for(int i=0; i<nodes.size(); i++){
    circle(nodes.get(i)[0], nodes.get(i)[1], len/30);  }
  pop();
  
  
  
  // start button
  rect(len-110, len-60, 100, 50, 10);
  textSize(30);
  text("START", len-100, len-25);
  
  
  time += 1;
}

void mousePressed(){
  is = true;
  for (int i=0; i<nodes.size(); i++){
    if (dist(nodes.get(i)[0], nodes.get(i)[1], mouseX, mouseY) < len/20 + 10){
      is = false;  }}
   if (mouseX > len-130 & mouseY > len-80){
      antColony = new Queen(nodes);
      antX = antColony.antPath();
      RUNNING = true;
   }
      
  if (is & !RUNNING & nodes.size() < 13){
    nodes.put(rec, new Integer[] {mouseX, mouseY});
    rec++;  }
    
}
