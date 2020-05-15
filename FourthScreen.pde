class FourthScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PImage leftarrow;
  PImage littePrince;
  PImage earth;

  void setupFunction() {

    c1 = color(87, 73, 115);
    c2 = color(251, 182, 142);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",25);
    textFont(f);
    imageMode(CENTER);
    leftarrow = loadImage("left.png");
    littePrince = loadImage("fourth.png");
    earth = loadImage("fourth2.png");

  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    text("행복한 시작",width/2,height/5);

    image(leftarrow,width/18,height-(height/25),23,37);
    image(earth,width/2,908,936,648);
    image(littePrince,width-(width/6), 860, 84, 250);

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
