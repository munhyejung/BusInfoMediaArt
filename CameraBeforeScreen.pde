class CameraBeforeScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PImage mask;

  void setupFunction() {
    
    //grgradient color
    c1 = color(345, 23, 52);
    c2 = color(16, 67, 99);

    fill(255);
    f = createFont("NotoSerifCJKkr-SemiBold.otf",24);
    textFont(f);
    
    //image
    imageMode(CENTER);
    mask = loadImage("fifth.png");


  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    image(mask, width/2, 760, 395, 463);
    color backgroundBlack = color(0,0,0,100);
    fill(backgroundBlack);
    noStroke();
    rect(0,0,width,height);

    //script
    textAlign(CENTER);
    fill(255);
    textFont(f);
    textLeading(55);
    text("여행을 떠나기 전\n 확인해주세요",width/2,(height/2)-90);

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