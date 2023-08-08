
ArrayList<Block> arr;

Ball a;
Paddle p;
PFont tx;
int score = 0;


public boolean RUNNING = true;

void setup(){
  size(900, 900);
  tx = createFont("urmom.ttf", 1.0f);
  textFont(tx);
  arr = new ArrayList<Block>();
  arr.add(new Block(80, 12, new PVector(255, 0, 0)));
  arr.add(new Block(100, 12, new PVector(255, 255, 0)));
  arr.add(new Block(120, 12, new PVector(0, 255, 60)));
  arr.add(new Block(140, 12, new PVector(0, 255, 255)));
  arr.add(new Block(160, 12, new PVector(192, 192, 192)));
  arr.add(new Block(180, 12, new PVector(255, 0, 255)));
  
  
  a = new Ball(new PVector(500, 500), new PVector(-4, -5), 10);
  p = new Paddle(700, 120, 20);
  
  
}


void draw(){
  background(0);
  
  a.display();
  p.display();
  
  
  a.updatePos();
  a.updateInteraction(p);
  
  
  for (int i=0; i<arr.size(); i++){
    arr.get(i).display();
    score += update(a, arr.get(i));
  }
  
  displayScoreAndTime(score, floor(round(frameCount/frameRate * 1000.0f))/1000.0f);
  
  

}
