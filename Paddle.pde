public class Paddle
{
  private PVector pos;
  private float len;
  private float wid;
  
  public Paddle(float h, float l, float w){
    this.pos = new PVector(0, h);
    this.len = l;
    this.wid = w;
  }
  
  public PVector getP(){return this.pos;}
  public float getL(){return this.len;}
  public float getW(){return this.wid;}
  
  public void display(){
    fill(0, 0, 255);
    stroke(0);
    if (mouseX < width - this.wid && RUNNING){this.pos.x = mouseX;}
      rect(this.pos.x, this.pos.y, this.len, this.wid);
  }
  
  
}
