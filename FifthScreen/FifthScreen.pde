int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

PFont f;
PImage background;

void setup() {
  size(600,1000);
  
  // Define colors
  c1 = color(1, 21, 38);
  c2 = color(4, 102, 140);
  noLoop();

  fill(255);
  f = createFont("NotoSerifCJKkr-ExtraLight.otf",18);
  textFont(f);
  imageMode(CENTER);
  background = loadImage("fifth.png");

}

void draw() {
  // Background
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  image(background, width/2, 750, 395, 463);
  color backgroundBlack = color(0,0,0,100);
  fill(backgroundBlack);
  noStroke();
  rect(0,0,width,height);
  
  textAlign(CENTER);
  textLeading(50);
  fill(255);
  text("네가 무턱대고\n 아무때나 찾아오면\n 난 언제부터\n 마음의 준비를\n 해야할지 모르니까",width/2,(height/2)-70);
  textSize(14);
  text("어린 왕자",width/2,(height/2)+250);

}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
