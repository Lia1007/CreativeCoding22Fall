// initial values for branch width and length
float firstWidth = 18;
float firstLength = 175;

// upper and lower bounds for the random percentage by which branches will be shrunk each iteration
float minScale = .5;
float maxScale = .8;

float minWidth = 1;
float minLength = 1;

color trunk = color(92,64,51);
PShape leaf;

void setup() {
  size(1000, 1000);
  background(166,209,94);
  stroke(trunk);

  leaf = loadShape("leaf.svg");

  translate(0,height);
  scale(1,-1);
}

void draw() {
}

void mousePressed() {
  // move to mouse position
  translate(mouseX,mouseY);
  // rotate so that measurements are more intuitive
  rotate(radians(180));
  tree(firstWidth * random(minScale,maxScale),firstLength * random(minScale,maxScale));
}

void tree(float w, float l) {
  if (w < minWidth || l < minLength) {
    pushMatrix();
    shape(leaf,0,0,constrain(w*20,3,10),constrain(w*15,3,10));
    popMatrix();
    return;
  }
  strokeWeight(w);
  line(0,0,0,l);
  
  translate(0,l); 
 

  float angle1 = random(-50, -33);
  float angle2 = random(-33, 33);  
  float angle3 = random(33, 50);
  angle3 = constrain(angle3,angle2,75);
  

  float shrinkWidth = random(minScale,maxScale);
  float shrinkLength = random(minScale,maxScale);
  

  pushMatrix();
  rotate(radians(angle1));
  tree(w * shrinkWidth, l * shrinkLength);
  popMatrix();
  

  shrinkWidth = random(minScale,maxScale);
  shrinkLength = random(minScale,maxScale);
  pushMatrix();
  rotate(radians(angle2));
  tree(w * shrinkWidth, l * shrinkLength);
  popMatrix();
  
  
  shrinkWidth = random(minScale,maxScale);
  shrinkLength = random(minScale,maxScale);
  pushMatrix();
  rotate(radians(angle3));
  tree(w * shrinkWidth, l * shrinkLength);
  popMatrix();
}
