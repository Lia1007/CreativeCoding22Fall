

float angle = 0.0;//预设变量angle为0

void setup() {
  size(1600,1600);//画布大小
  background(#B9FFED);//背景颜色
}

void draw() {
  stroke(#BCD1CB);//边框颜色
  if (mousePressed) {
    fill(#32FAC6);//如果点击鼠标，填充青色
  } else {
    fill(#16715A);//如果不点击鼠标，填充翠绿色
  }
 translate(mouseX,mouseY);//平移至鼠标所在处

rotate(angle);//旋转

rect(-15,-15,300,300);//设定正方形

angle += 0.1;//每次增加0.1


}
