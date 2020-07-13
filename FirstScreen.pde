class FirstScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PImage background;
  PImage handSanitizer;

  void setupFunction() {
    
    //grgradient color
    c1 = color(184, 46, 107);
    c2 = color(209, 136, 33);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",24);
    textFont(f);
    
    //image
    imageMode(CENTER);
    background = loadImage("First.png");
    handSanitizer = loadImage("hand.png");
  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    color backgroundBlack = color(0,0,0,100);
    fill(backgroundBlack);
    noStroke();
    rect(0,0,width,height);

    //script
    textAlign(CENTER);
    fill(255);
    textFont(f);
    textLeading(55);
    text("네가 오후 4시에 온다면\n 나는 3시부터\n 예방하기 시작할 거야",(width/2),(height/2)-90);

    image(background, width/2, 1000, 441, 554);
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