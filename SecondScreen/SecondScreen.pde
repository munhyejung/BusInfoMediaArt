int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

PFont f;
PImage img;
PImage img2;
PImage img3;

void setup() {
  size(600,1000);
  
  // Define colors
  c1 = color(16, 30, 55);
  c2 = color(106, 106, 106);
  noLoop();

  fill(255);
  f = createFont("NotoSerifCJKkr-ExtraLight.otf",25);
  textFont(f);
  imageMode(CENTER);
  img = loadImage("Second.png");
  img2 = loadImage("Second2.png");
  img3 = loadImage("right.png");

}

void draw() {
  // Background
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  textAlign(CENTER);
  textLeading(50); 
  text("행복해지기 전",width/2,height/5);

  image(img2,width/2,1150,814,829);
  image(img, width/10, 850, 78, 246);
  image(img3,width-(width/20),height-(height/28),23,37);

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
