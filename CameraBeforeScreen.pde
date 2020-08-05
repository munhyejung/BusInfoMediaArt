class CameraBeforeScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PImage mask;
  PImage rightarrow;
  PImage leftarrow;
  
  void setupFunction() {
    
    //grgradient color
    c1 = color(133, 102, 110 );
    c2 = color(253, 127, 83);

    fill(255);
    f = createFont("NotoSerifCJKkr-SemiBold.otf",24);
    textFont(f);
    
    //image
    imageMode(CENTER);
    mask = loadImage("mask.png");
    rightarrow = loadImage("right.png");
    leftarrow = loadImage("left.png");


  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    image(mask, width/2, height-450 , 268.45, 136.15);
    noStroke();

    image(rightarrow,width-(width/18),height-(height/25),23,37);
    image(leftarrow,width/18,height-(height/25),23,37);

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