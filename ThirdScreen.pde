class ThirdScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PImage rightarrow;
  PImage leftarrow;

  void setupFunction() {
    
    c1 = color(19, 128, 223);
    c2 = color(134, 203, 245);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",25);
    textFont(f);
    imageMode(CENTER);
    rightarrow = loadImage("right.png");
    leftarrow = loadImage("left.png");

  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    text("행복해지기 시작",width/2,height/5);

    image(rightarrow,width-(width/18),height-(height/25),23,37);
    image(leftarrow,width/18,height-(height/25),23,37);
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

}
