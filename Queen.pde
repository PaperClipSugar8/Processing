public class Queen
{

  private HashMap<Integer, Integer[]> ogG;
  private float[][] graph;
  public float[][] pheromone;
  private float[][] probDB;
  public HashMap<Integer, int[]> pathWays;
  
  public Queen(HashMap<Integer, Integer[]> g){
    this.ogG = g;
    this.graph = distanceMatrix(g);
    this.pheromone = new float[this.graph.length][this.graph.length];
    for (int i=0; i<this.graph.length; i++){
      for (int j=0; j<this.graph.length; j++){
        this.pheromone[i][j] = 1.0f;  }}
    this.probDB = probablityDistribution(this.graph, this.pheromone);
    this.pathWays = new HashMap<Integer, int[]>();
    this.pathWays.put(0, xXx(this.probDB));
    
  }
  
  public int[] getBestPath(){
    float best = 1.0f / 0.0f;
    int dx = 0;
    for (int b=0; b<this.pathWays.size(); b++){
      if (this.totalCost(this.pathWays.get(b)) < best){
        dx = b;
        best = this.totalCost(this.pathWays.get(b));
      }
    }
    return this.pathWays.get(dx);
  }
  
  public float totalCost(int[] path){
    float total = 0.0f;
    for (int i=0; i<path.length; i++){
      total += this.graph[path[i]][path[(i+1)%path.length]];  }
    return total;  }
  
  public HashMap<Integer, Integer[]> getogG(){return this.ogG;  }
  
  public float[][] getPheromone(){return this.pheromone;  }
  
  public int[] antPath(){return xXx(this.probDB);  }
  
  public void updatePheromone(int[] path){
    this.pheromone = newPheromoneMatrix(path, this.pheromone, this.graph);  }
  
  public void updateProbDB(){
    this.probDB = probablityDistribution(this.graph, this.pheromone);  }
  
  public void drawPath(int[] path){

    for (int i=0; i<path.length; i++){
      line(this.ogG.get(path[i])[0], this.ogG.get(path[i])[1],
           this.ogG.get(path[(i+1)%path.length])[0], this.ogG.get(path[(i+1)%path.length])[1]);
    }
  }
  
  
  

  
}
