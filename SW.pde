

public class SW extends PApplet
{
  
  public int secLen;

  SW(int sl){
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    this.secLen = sl;
  }
  
     void setup(){
      surface.setLocation(720, 120);
      surface.setSize(this.secLen, this.secLen);
      surface.setFrameRate(10);
     }
     
     
}
