int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  int barSize = 200;
  int barHeight = 20;
  int barInterval = barHeight + 10;

  bar.addSlider("sectionSideNum", 3, 16, 5, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("断面边数");
  bar.addSlider("cylinderSectionHeight", 0, 20, 10, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("柱体分段高度");
  bar.addSlider("sectionRadiusPhase", 0, PI*16, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("柱体半径相变");

  bar.addSlider("R", 0, 255, 51, canvasLeftCornerX,  canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("光线R值");
  bar.addSlider("G", 0, 255, 102, canvasLeftCornerX,  canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("光线G值");
  bar.addSlider("B", 0, 255, 126, canvasLeftCornerX,  canvasLeftCornerY+barInterval*6, barSize, barHeight).setLabel("光线B值");
  
  bar.addSlider("BackgroundcolourR", 0, 255, 0, canvasLeftCornerX,  canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("背景颜色R值");
  bar.addSlider("BackgroundcolourG", 0, 255, 0, canvasLeftCornerX,  canvasLeftCornerY+barInterval*9, barSize, barHeight).setLabel("背景颜色G值");
  bar.addSlider("BackgroundcolourB", 0, 255, 0, canvasLeftCornerX,  canvasLeftCornerY+barInterval*10, barSize, barHeight).setLabel("背景颜色B值");
  bar.setAutoDraw(false);
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}

void UIShow() {
  cam.beginHUD();  
  lights();
  bar.draw();
  cam.endHUD();

  if (mouseX<400 && mouseY< height) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}
