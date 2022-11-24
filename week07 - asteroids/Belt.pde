class Belt {

  final static int POPSIZE = 25;

  Asteroid[] roids;
  ArrayList<Asteroid> matingpool;

  int generation;
  int mutate;

  Belt(int m) {
    roids = new Asteroid[POPSIZE];
    matingpool = new ArrayList<Asteroid>();
    generation = 0;
    mutate = m;

    for (int i = 0; i < POPSIZE; i++) {
      roids[i] = new Asteroid();
    }
  }

  void darwinism() {
    calcFit();
    
    float maxFitness = getMaxFit();

    matingpool.clear();

    for (int i = 0; i < POPSIZE; i++) {
      int n = (int)(normFit(roids[i], maxFitness) * 100); //*100 makes it a percent, essentially
      for (int j = 0; j < n; j++) {
        //adds astroid to mating pool
        //higher the fitness, the more it is added
        matingpool.add(roids[i]);
      }
    }
  }

  //mixes the DNA of two asteroids
  //randomly selected from pool
  void reproduce() {

    for (int i = 0; i < POPSIZE; i++) {
      //calculates two random values from
      //0 to the size of the pool
      int aRand = int(random(0,matingpool.size()));
      int bRand = int(random(0,matingpool.size()));

      //selects the two parents out of the pool
      Asteroid parentA = matingpool.get(aRand);
      Asteroid parentB = matingpool.get(bRand);

      //extracts their DNA
      DNA aDna = parentA.getDna();
      DNA bDna = parentB.getDna();

      //mixes the dna, and viola: a baby
      DNA offspring = aDna.mix(bDna);
      
      //baby has a chance to mutate
      offspring.mutation(mutate);
      
      roids[i] = new Asteroid(offspring);
    }
    //increments generation
    generation++;
  }
  
  //iterates through and calculates the fitness
  void calcFit() {
    for(int i = 0; i < POPSIZE; i++){
      roids[i].calcFitness();
    }
  }

  //finds the maximum fitness within the asteroids
  float getMaxFit() {
    float max = 0;
    for (int i = 0; i < POPSIZE; i++) {
      float curr = roids[i].getFitness();
      if (curr > max) {
        max = curr;
      }
    }
    return max;
  }


  //maps the fitness between 0 and 1 and returns
  float normFit(Asteroid roid, float max) {
    return map(roid.getFitness(), 0, max, 0, 1);
  }

  void run() {
    for (int i = 0; i < POPSIZE; i++) {
      roids[i].run();
    }
  }
  
  //accessor method
  int getGen() {
    return generation;
  }
}
