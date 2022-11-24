class Planet {

  int r;
  color c;
  PVector location;

  Planet() {
    //this default constructor is intended for the target
    r = 30;
    c = color(10, 250, 200);
    location = new PVector(width - r*2, r*2, 0);
  }

  Planet(float x, float y, int radius, color col) {
    //this constructor is inteded for any obstacles
    r = radius;
    c = col;
    location = new PVector(x, y);
  }

  //render method
  void display() {
    fill(c);
    pushMatrix();
    translate(location.x, location.y); 
    sphere(r);
    popMatrix();
    //ellipse(location.x, location.y, r*2, r*2);
  }

  //accessor methods
  int getRadius() {
    return r;
  }

  float getX() {
    return location.x;
  }

  float getY() {
    return location.y;
  }
}
