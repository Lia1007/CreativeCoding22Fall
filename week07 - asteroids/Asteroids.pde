class Asteroid {

  int r;
  color c;
  boolean hit;
  boolean crash;
  float fitness;

  PVector pos, vel, acc;

  DNA dna;


  Asteroid() {
    r = 10;
    fitness = 0.0;
    c = color(255, 100);
    dna = new DNA();
    pos = new PVector(r*4, height - r*4);
    vel = new PVector();
    acc = new PVector();
  }

  Asteroid(DNA replacement) {
    r = 10;
    fitness = 0.0;
    c = color(255, 200);
    dna = replacement;
    pos = new PVector(r*4, height - r*4);
    vel = new PVector();
    acc = new PVector();
  }
  void calcFitness() {
    float distance = dist(pos.x, pos.y, target.getX(), target.getY());
    fitness = 1/distance; 
  }

  boolean collided(Planet obj) {
    int minSpace = r + obj.getRadius();
    float distance = dist(pos.x, pos.y, obj.getX(), obj.getY());
    //returns true if the object has collided with a planet
    return distance < minSpace;
  }

  void applyForce(PVector f) {
    //adds force vector from dna
    acc.add(f);
  }

  void run() {
    //checks if the asteroid has collided with the target or the obstacle
    hit = collided(target);
    crash = collided(obstacle);

    if (!hit && !crash) {
      applyForce(dna.genes[lifeCounter]);
      update();
    } else {
      calcFitness();
      if (hit) {
        //rewards hitting the target
        setFitness(fitness * 10);
      } else {
        //deincentivizes hitting the obstacle
        setFitness(fitness / 10);
      }
    }
    display();
  }

  void update() {
    //resets acceleration after
    vel.add(acc);
    pos.add(vel);
    acc.mult(0.0);
  }

  void display() {
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y); 
    sphere(r);
    popMatrix();
  }

  float getFitness() {
    return fitness;
  }

  DNA getDna() {
    return dna;
  }

  //set method
  void setFitness(float fit) {
    fitness = fit;
  }
}
