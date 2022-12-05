import ddf.minim.analysis.*;
import ddf.minim.*;//引用minim库，用来播放音乐
Minim minim;
PVector Position;
PVector Velocity;
ParticleSystem ps = new ParticleSystem(new PVector(width/2, 630));
AudioPlayer[] music=new AudioPlayer[4];
PImage base;//背景图片
PImage kuang;//唱片框
PImage heart; // 爱心
PImage[] p=new  PImage[4];//专辑图片数组
int index=0;//当前音乐
float angle=0;
float voice;//声明一个float变量，用来存储音乐的音量，因为我想做音乐交互~~~
void setup()
{
  size(1181, 1574);
  minim = new Minim(this);
  base=loadImage("base.png");
  base.resize(1181, 1574);
  //kuang=loadImage("kuang.png");
  for (int i=0; i<p.length; i++)
  {   
    p[i]=loadImage("p"+i+".png");
    p[i].resize(750, 750);
  }
  for (int i=0; i<music.length; i++)
  {
    music[i]= minim.loadFile("music"+i+".mp3", 2048);
  }
  imageMode(CENTER);
  music[index].play();
  heart = loadImage("heart.png");
  heart.resize(100, 100);
}
void draw()
{
  voice = music[index].mix.level();
  //背景
  image(base, width/2, height/2);
  pushMatrix();
  translate(width/2, 630);//确定旋转中心
  rotate(radians(angle));//旋转
  //封面
  image(p[index], 0, 0);
  //唱片框
  //image(kuang, 0, 0);
  popMatrix();
  if (music[index].isPlaying())
  {
    angle+=1;
  }
  //播放条
  //未播放
  noStroke();
  fill(#E5E5E5);
  rect(325, 1400, 800, 17, 20);

  float pos = map(music[index].position(), 0, music[index].length(), 0, 1048);
  if (pos>1044) {
    music[index].rewind();
    music[index].pause();
    index+=1;
    if (index==music.length)
    {
      index=0;
    }
    music[index].play();
    angle=0;
  }


  //已播放
  noStroke();
  fill(#3A5977);
  rect(324, 1400, pos, 19, 20);
  //按钮
  noStroke();
  fill(#E9F4FF);
  ellipse(pos+325, 1405, 32, 32);
  fill(#3A5977);
  ellipse(pos+325, 1405, 18, 18);

  //暂停，前一首，后一首
  //暂停
  if (music[index].isPlaying())
  {
    noStroke();
    fill(#E9F4FF);
    rect(150, 1390, 7, 41, 4);
    rect(170, 1390, 7, 41, 4);
  } else {
    noStroke();
    fill(#E9F4FF);
    triangle(150, 1390, 150, 1431, 180, 1410);
  }
  //左
  noStroke();
  fill(#E9F4FF);
  rect(80, 1392, 4, 38, 2);
  triangle(80, 1411, 110, 1392, 110, 1430);
  //右
  noStroke();
  fill(#E9F4FF);
  rect(240, 1392, 4, 38, 2);
  triangle(240, 1411, 210, 1392, 210, 1430);

  //控制进度
  if (mousePressed&mouseX>325&&mouseX<1125&&mouseY>1399&&mouseY<1418) {
    int position=(int)map(mouseX, 325, 1373, 0, music[index].length());
    music[index].cue(position);
  }

  pushMatrix();
  translate(width/2+580, height);
  rotate(PI);
  for (int i=0; i<40; i++)
  {
    fill(255);
    rect(29*i, 0, 26, voice*300*noise(i));
  }
  popMatrix();

  int minSize = 300;
  int range = 130;  

translate(width/2, height/2.5);

  for (int i=0; i<music[index].right.size(); i+=4) {
    stroke(color(255 - sin(map(i, 0, music[index].right.size(), 0, 1) * PI) * 255, 0, sin(map(i, 0, music[index].right.size(), 0, 1) * PI) * 255));
    float r = map(i, 0, music[index].right.size(), 0, 2 * PI);
    float s = abs(music[index].right.get(i))*range;
    line(sin(r) * (minSize), cos(r) * (minSize), sin(r) * (s + minSize), cos(r) * (s + minSize));
  }

}
void mousePressed()
{
  if (mouseX>149&&mouseX<171&&mouseY>1389&&mouseY<1432)
  {
    if (music[index].isPlaying())
    {
      music[index].pause();//暂停当前音乐
    } else {
      music[index].play();
    }
  } else if (mouseX>79&&mouseX<111&&mouseY>1389&&mouseY<1432)//切换到上一首
  {
    //切换歌曲需要做的事情
    //1。当前歌曲退回到最开始的位置
    //2.当前歌曲需要停下来
    //唱片旋转角度复位
    music[index].rewind();
    music[index].pause();
    index-=1;
    if (index==-1) {
      index=music.length-1;
    }
    music[index].play();
    angle=0;
  } else if (mouseX>209&&mouseX<241&&mouseY>1389&&mouseY<1432)
  {
    music[index].rewind();
    music[index].pause();
    index+=1;
    if (index==music.length) {
      index=0;
    }
    music[index].play();
    angle=0;
  } else if (mouseX>215&&mouseX<965&&mouseY>255&&mouseY<1005)
  {
  ps.DrawParticle();
  }

}
class ParticleSystem {
  ArrayList<Particle> pList = new ArrayList<Particle>();




  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.copy();
    pList = new ArrayList();

    for (int i = 0; i< 5; i++)
    {
      pList.add(new Particle(origin));
    }
  }

void DrawParticle() {

    for (int i= pList.size()-1; i >= 0; i--)
    {
      Particle p = pList.get(i);
      p.reload();
      p.render();
    }
    addParticle();
  }



  void addParticle() 
  {

    pList.add(new Particle(origin));
  }
}
