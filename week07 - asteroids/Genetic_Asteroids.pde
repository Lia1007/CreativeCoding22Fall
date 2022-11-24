Belt belt;
Planet target;
Planet obstacle;

int stars;
int lifeSpan;
int lifeCounter;
int mutationFactor;

color obCol;

public void settings() {
  size(600, 600, "processing.opengl.PGraphics3D");
}
void setup() {
  noStroke();

  stars = 5;
  lifeSpan = 500;
  lifeCounter = 0;
  mutationFactor = 40; //percentage :: between 0 and 100
  obCol = color(159, 143, 67);

  belt = new Belt(mutationFactor);
  target = new Planet();
  obstacle = new Planet(width/2, height/2, 60, obCol);
}


void draw() {
  lights();
  //background(50);
  fill(25, 50);
  rect(0, 0, width, height);

  //draw the stars
  for (int i = 0; i < stars; i++ ) {
    fill(255);
    ellipse(random(width), random(height), 2, 2);
  }

  //draw the planets
  target.display();
  obstacle.display();

  if (lifeCounter < lifeSpan) {
    //run the generation
    belt.run();
    lifeCounter++;
  } else {
    //reset
    belt.darwinism();
    belt.reproduce();
    lifeCounter = 0;
  }
}
