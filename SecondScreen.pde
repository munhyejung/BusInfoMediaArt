class SecondScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PImage littlePrince;
  PImage B612;
  PImage rightarrow;

  void setupFunction() {
    
    c1 = color(16, 30, 55);
    c2 = color(106, 106, 106);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",25);
    textFont(f);
    imageMode(CENTER);
    littlePrince = loadImage("Second.png");
    B612 = loadImage("Second2.png");
    rightarrow = loadImage("right.png");

  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    text("행복해지기 전",width/2,height/5);

    image(B612,width/2,1150,814,829);
    image(littlePrince, width/10, 850, 78, 246);
    image(rightarrow,width-(width/18),height-(height/25),23,37);

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
