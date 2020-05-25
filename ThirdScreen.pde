class ThirdScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  int currentPage = 0;

  PFont f;
  PFont busNumf;
  PImage rightarrow;
  PImage leftarrow;

  void setupFunction() {
    
    c1 = color(19, 128, 223);
    c2 = color(134, 203, 245);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",28);
    busNumf = createFont("NotoSerifCJKkr-SemiBold.otf",35);
    imageMode(CENTER);
    rightarrow = loadImage("right.png");
    leftarrow = loadImage("left.png");

  }

  void drawFunction(ArrayList<BusInfo> returnedData) {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    textFont(f);
    text("행복해지기 시작",width/2,height/8);

    image(rightarrow,width-(width/18),height-(height/25),23,37);
    image(leftarrow,width/18,height-(height/25),23,37);
  
    println(returnedData.size());
    println("Current Page" + currentPage);

    for(int i = currentPage*8; i<returnedData.size(); i++) {

      if(i%8 == 0 && i == (currentPage+1)*8) {
        break;
      }

      int y = (height/6 + ((i%8)+1)*80);
      textFont(busNumf);
      textAlign(LEFT);

      text(returnedData.get(i).busNum + "번",width/4,y);
      println(returnedData.get(i).busNum);
      textSize(20);
      text("여우와 함께 여행 중",width/2,y-11);
      textSize(15);
      text("도착 " + returnedData.get(i).time1 + "분 전",width/2,(15+y)-6);
    }

    currentPage++;

    if(currentPage > 1) {
      currentPage = 0;
      
    }
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
