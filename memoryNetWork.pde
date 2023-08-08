
import peasy.*;

PeasyCam cam;


/*
float[] data =  {
                  1, 1, 1, -1, -1, -1, -1, 1, 1, 1,
                  1, 1, -1, 1, 1, 1, 1, -1, 1, 1,
                  1, -1, 1, 1, 1, 1, 1, 1, -1, 1,
                  1, -1, 1, 1, 1, 1, 1, 1, -1, 1,
                  1, -1, 1, 1, 1, 1, 1, 1, -1, 1,
                  1, -1, 1, 1, 1, 1, 1, 1, -1, 1,
                  1, -1, 1, 1, 1, 1, 1, 1, -1, 1,
                  1, -1, 1, 1, 1, -1, -1, 1, -1, 1,
                  1, 1, -1, 1, 1, 1, 1, -1, 1, 1,
                  1, 1, 1, -1, -1, -1, -1, 1, -1, -1};
*/

float[] data = {
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.2, -0.5, -0.5, 0.2, 0.1,
0.1, 0.2, -0.5, -0.5, 0.2, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,

0.1, 0.4, 0.3, 0.3, 0.4, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.2, -0.6, -0.6, 0.2, 0.1,
0.1, 0.2, -0.6, -0.6, 0.2, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,

0.1, 0.4, 0.3, 0.3, 0.4, 0.1,
0.1, 0.2, -0.3, -0.3, 0.2, 0.1,
0.1, -0.2, -0.7, -0.7, -0.2, 0.1,
0.1, -0.2, -0.7, -0.7, -0.2, 0.1,
0.1, 0.2, -0.3, -0.3, 0.2, 0.1,
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,

0.1, 0.4, 0.3, 0.3, 0.4, 0.1,
0.1, 0.2, -0.3, -0.3, 0.2, 0.1,
0.1, -0.2, -0.7, -0.7, -0.2, 0.1,
0.1, -0.2, -0.7, -0.7, -0.2, 0.1,
0.1, 0.2, -0.3, -0.3, 0.2, 0.1,
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,

0.1, 0.4, 0.3, 0.3, 0.4, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.2, -0.6, -0.6, 0.2, 0.1,
0.1, 0.2, -0.6, -0.6, 0.2, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,

0.1, 0.4, 0.3, 0.3, 0.4, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.2, -0.5, -0.5, 0.2, 0.1,
0.1, 0.2, -0.5, -0.5, 0.2, 0.1,
0.1, 0.2, 0.3, 0.3, 0.2, 0.1,
0.1, 0.4, 0.3, 0.3, 0.4, 0.1,

  
};






                  
NetWork m;
int res = 6;
double TIME = 61;
PVector gg;
PVector[] ggw;


public PVector check(int index){
         for (int a=0; a<res; a++){
            for (int b=0; b<res; b++){
                for (int c=0; c<res; c++){ 
                    if ((res * a + b) * res + c == index){
                      return new PVector(map(a, 0, res, 0, 200),
                                         map(b, 0, res, 0, 200),
                                         map(c, 0, res, 0, 200));
                    }
                }
            }
         }
          return new PVector(0, 0, 0); 
     }
    


void setup(){
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100, 100, 100, 300);
  
  
  m = new NetWork(data);
  m.initWeights();
  
  gg = check(m.edex());
  ggw = m.getWeights();
  
  frameRate(20);
  
}

void draw(){
  background(0);
  
  if (TIME % 5.0 == 0){
     m.asynchronous();
     m.updateNeuronsByOne();
     m.associate();
     gg = check(m.edex());
     ggw = m.getWeights();
     System.out.println(">>> UPDATE");
     for (int f=0; f<m.neuronss().length; f++){
        System.out.print(m.neuronss()[f] + ", ");
     }
      System.out.println("~selected: " + gg);
   }

  for (int i=0; i<res; i++){
    float x = map(i, 0, res, 0, 200);
    for (int j=0; j<res; j++){
      float y = map(j, 0, res, 0, 200);
      for (int k=0; k<res; k++){
        float z = map(k, 0, res, 0, 200);
        push();
        int ccc = m.nc()[(res * i + j) * res + k];
        fill(ccc, ccc, ccc, ccc);
        
        push();
        strokeWeight(3);
        PVector colour = ggw[(res * i + j) * res + k];
        stroke(colour.x, colour.y, colour.z, 90);
        line(x, y, z, gg.x, gg.y, gg.z);
        pop();
        
        translate(x, y, z);
        box(120/res);
        pop();
        }
      }
    }

    TIME += 1.0;
    System.out.println(">>> " + "t = " + TIME);
    
}
