int bgWidth = 1000;
int bgHeight = 1000;
float lineSize = 0;
float colSize = 0;

color[] colors = {#96794a, #ca7653, #ca7653, #c8a86e, #c58e3c, #946c32, #7b823a, #b5853a, #c0c37a};
//洛可可配色

void MondrianStyle() {
  for (int line = 0; line < bgHeight; line += lineSize + 3) {
    lineSize = random(4, bgWidth/3);
    for (int col = 0; col < bgWidth; col += colSize + 3) {
      colSize = random(4, bgHeight/2);// 方块大小

      color RectColor = colors[int(random(colors.length))];
      fill(RectColor);
      rect(col, line, colSize, lineSize);//给方块填色

      strokeWeight(3);
      stroke(#2e170f);
      float x = col+colSize;
      float y = line+lineSize;
      line(0, y, bgWidth, y);
      line(x, line, x, y);//画线
    }
  }
}

void setup() {
  size(1000, 1000);
  MondrianStyle(); 
}

void draw() {
  if (mousePressed) {
    MondrianStyle();
    saveFrame();
  }
  
}
