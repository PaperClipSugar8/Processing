

public float[][] distanceMatrix(HashMap<Integer, Integer[]> vertices){
  float[][] mx = new float[vertices.size()][vertices.size()];
  for (int i=0; i<vertices.size(); i++){
    for (int j=0; j<vertices.size(); j++){
      mx[i][j] = dist(vertices.get(i)[0], vertices.get(i)[1],
                      vertices.get(j)[0], vertices.get(j)[1]);
      }
    }
  return mx;
}


public float[][] probablityDistribution(float[][] disM, float[][] pheromoneMatrix){
  // entries too small
  
  float[][] mx = new float[disM.length][disM.length];
  for (int i=0; i<disM.length; i++){
    float sunm = 0.0f;
    for (int k=0; k<disM.length; k++){
    if (disM[i][k] == 0){sunm += 0;  }
      else{
        sunm += (1.0f / disM[i][k]) * pheromoneMatrix[i][k];
      }
  }
    
     for (int j=0; j<disM.length; j++){
       mx[i][j] = ((1.0f / disM[i][j]) * pheromoneMatrix[i][j]) / sunm;
       if (disM[i][j] == 0.0f){mx[i][j] = 0.0f;  }
       }
     }
  return mx;
}

//  complete path has same dimension as the collection of vertices "1->2->4->5->3" ->1
public float[][] newPheromoneMatrix(int[] path, float[][] previousPheromone, float[][] disM){
  float[][] reward = new float[path.length][path.length];
  float totalCost = 0.0f;
  for (int i=0; i<path.length; i++){
    totalCost += disM[path[i]][path[(i+1)%path.length]];  }
  for (int i=0; i<path.length; i++){
    for (int j=0; j<path.length; j++){
      reward[i][j] = previousPheromone[i][j] + (10.0f / totalCost);
    }}
  return reward;
}


public static int[] xXx(float[][] db){
    int[] path = new int[db.length];
    float[][] sacrifice = new float[db.length][db.length];
    for (int x=0; x<db.length; x++){
      for (int y=0; y<db.length; y++){
        sacrifice[x][y] = db[x][y];  }}
    
    int max = sacrifice.length-1;
    int min = 0;
    int index = (int)(Math.random()*(max - min) + min);
    
    ArrayList<Integer> yourmom = new ArrayList<Integer>();
    
    while(yourmom.size() < sacrifice.length){
      yourmom.add(index);
      ArrayList<Integer> samples = new ArrayList<Integer>();
      for(int i=0; i<sacrifice[index].length; i++){
        int ea = (int)Math.round(sacrifice[index][i] * 20f);
        for (int j=0; j<ea; j++){
          samples.add(i);  }}
      max = samples.size()-1;
      if (samples.size() == 0){break;  }
      index = samples.get((int)(Math.random()*(max-min)+min));

      for (int y=0; y<yourmom.size(); y++){
        sacrifice[yourmom.get(y)][index] = 0.0f;
        sacrifice[index][yourmom.get(y)] = 0.0f;  }}
    
    for (int i=0; i<yourmom.size(); i++){path[i] = yourmom.get(i);  }
    return path;
  }
