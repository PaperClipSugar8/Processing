public class NetWork
{
  private float[][] desires;
  private int numDes;
  private float[] neurons;
  private float[][] weights;
  private int[] neuronsColor;
  private int randIndex;
  
  public NetWork(float[]... des){
    this.numDes = des.length;
    this.desires = des;
    this.neurons = new float[des[0].length];
    for (int i=0; i<this.neurons.length; i++){this.neurons[i] = 1.0;  }
    this.weights = new float[this.neurons.length][this.neurons.length];
    this.neuronsColor = new int[this.neurons.length];
    this.randIndex = 0;
  }
  
  public int nd(){return this.numDes;  }
  public float[][] ds(){return this.desires;  }
  public float[] neuronss(){return this.neurons;  }
  public int[] nc(){return this.neuronsColor;  }
  public int edex(){return this.randIndex;  }
  
  public PVector[] getWeights(){
    PVector[] vals = new PVector[this.weights[this.randIndex].length];
    for(int i=0; i<this.weights[this.randIndex].length; i++){
      int eee = (int)map(this.weights[this.randIndex][i], -1, 1, 0, 3);
      float c = map(this.weights[this.randIndex][i], -1, 1, 0, 255);
      if (eee < 1){vals[i] = new PVector(c, c, c);  }
      if (eee < 2 & eee > 1){vals[i] = new PVector(c, 0, c);  }
      vals[i] = new PVector(c, c, 0);
  }
    return vals;
  }
  
  
  public float preceptron(float val){
    if(val >= 0.0){return 1.0;  }
    return -1;
  }
  
  public float sigmoid(float val){
    return 1.0 / (1.0 + exp(-val));
  }
  
  public void initWeights(){
    for (int i=0; i<this.neurons.length; i++){
      for (int j=0; j<this.neurons.length; j++){
        
        this.weights[i][j] = 0;
        if (i != j){
          for (int k=0; k<this.numDes; k++){
            this.weights[i][j] += (1.0 / (float)this.numDes) * this.desires[k][i] * this.desires[k][j];
          }
        }
        
      }
    }
  }
  
  public void asynchronous(){
    int min = 0;  int max = this.neurons.length-1;
    this.randIndex = (int)Math.floor(Math.random() *(max - min + 1) + min);
  }
  
  public void updateNeuronsByOne(){
    float acv = 0;
    for (int i=0; i<this.neurons.length; i++){acv += this.neurons[i] * this.weights[this.randIndex][i];  }
    this.neurons[this.randIndex] = this.sigmoid(acv);
  }
  
  public void associate(){
    for (int i=0; i<this.neurons.length; i++){this.neuronsColor[i] = (int)map(this.neurons[i], -1, 1, 0, 255);  }
  }
  
  
  
}
