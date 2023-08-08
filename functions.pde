// for detecting collision between ball and blocks
public int update(Ball b, Block r){
    if (b.getP().y > r.getY() && b.getP().y < r.getY() + r.getR()/3){
      for (int i=0; i<r.getS().length; i++){
        if (r.getS()[i]){
          if (b.getP().x > r.getR() * i && b.getP().x < r.getR() * (i+1)){
            r.getS()[i] = false;
            b.setY(b.getV().y*-1);
            return 1;
          }
        }
      }
    }
    return 0;
}

public void displayScoreAndTime(int s, float t){
  push();
  fill(0, 60, 255, 100);
  rect(0, 50, width, 20);
  pop();
  textSize(30);
  textAlign(CENTER);
  fill(255);
  text(s, 100, 30);
  text(t, width-100, 30);
  
  if (!RUNNING){
    stroke(255);
    fill(0, 255, 60, 120);
    strokeWeight(10);
    textSize(500);
    text("GG", width/2, height/2);
    
    noLoop();
  }
}









/*
public void collision(Ball b, Paddle p){
  if (PVector.sub(p.getP(), b.getP()).mag()<= b.getS()+p.getS()){
    
    PVector n = PVector.sub(b.getP(), p.getP());
    float lenN = n.mag();
    PVector un = PVector.div(n, lenN);
    PVector ut = new PVector(-un.y, un.x);
    float v1n = PVector.dot(un, b.getV());
    float v2n = PVector.dot(un, p.getV());
    float v1t = PVector.dot(ut, b.getV());
    //float v2t = PVector.dot(ut, p.getV());
    float m1 = (v1n*(b.getS()-p.getS())+(2.0f * p.getS()*v2n) )/(b.getS()+p.getS());
    //float m2 = (v2n*(p.getS()-b.getS())+(2.0f * b.getS()*v1n) )/ (p.getS() + b.getS());
    PVector bvel = PVector.add(PVector.mult(un, m1), PVector.mult(ut, v1t));
    //PVector pvel = PVector.add(PVector.mult(un, m2), PVector.mult(ut, v2t));
    
    
    b.setY(-b.getP().y);
  }
}
*/


  
