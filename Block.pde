public class Block
{
  private float y;
  private float res;
  private boolean[] state;
  private PVector colour;
  
  public Block(float h, int x, PVector c){
     this.y = h;
     this.res = map(1, 0, x, 0, width);
     this.state = new boolean[x];
     for (int i=0; i<x; i++){this.state[i] = true;  }
     this.colour = c;
  }
  
  public float getY(){return this.y;}
  public boolean[] getS(){return this.state;}
  public float getR(){return this.res;}
  
  public void display(){
    for (int i=0; i<this.state.length; i++){
      fill(this.colour.x, this.colour.y, this.colour.z);
      stroke(0);
      if (this.state[i]){
        rect(this.res * i, y, this.res, 20);
      }
    }
  }
  
  
  
  
}
