public class Ball
{
  private PVector pos;
  private PVector vel;
  private float s;
  
  
  public Ball(PVector pos, PVector v, float si){
    this.pos = pos;
    this.s = si;
    this.vel = v;
  }
  public PVector getP(){return this.pos;}
  public PVector getV(){return this.vel;}
  public float getS(){return this.s;}
  public void setX(float x){this.vel.x = x;}
  public void setY(float y){this.vel.y = y;}
  
  public void display(){
    push();
    rectMode(CENTER);
    fill(255, 255, 255);
    rect(this.pos.x, this.pos.y, this.s, this.s);
    pop();
  }
  
  public void updatePos(){
    if (RUNNING){
      if (this.pos.x < this.s/2 || this.pos.x > width-this.s/2){this.vel.x*=-1;}
      if (this.pos.y < this.s/2){this.vel.y*=-1;}
      this.pos.add(this.vel);
    }
  }
  
  public void updateInteraction(Paddle p){
    if (this.pos.y > height){RUNNING = false;}
    
    if (this.pos.y > p.getP().y - p.getW() && this.pos.y < p.getP().y + p.getW() &&
    (this.pos.x > p.getP().x - p.getL() && this.pos.x < p.getP().x + p.getL())){
      this.vel.y*=-1;
    }
  }
  
    
  
  
  
  
  
}
