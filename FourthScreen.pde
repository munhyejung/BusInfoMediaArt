class FourthScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PFont busNumf;
  PImage leftarrow;
  PImage littePrince;
  PImage earth;

  void setupFunction() {

    //grgradient color
    c1 = color(87, 73, 115);
    c2 = color(251, 182, 142);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",28);
    busNumf = createFont("NotoSerifCJKkr-SemiBold.otf",35);
    imageMode(CENTER);
    leftarrow = loadImage("left.png");
    littePrince = loadImage("fourth.png");
    earth = loadImage("fourth2.png");

  }

  void drawFunction(ArrayList<BusInfo> returnedData) {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    textFont(f);
    text("행복한 시작",width/2,height/8);
    text("전 일 대비 환자 수 증감",width-(width/4),height-(height/4));

    //image
    image(leftarrow,width/18,height-(height/25),23,37);
    image(earth,width/2,908,936,648);
    image(littePrince,width-(width/6), 860, 84, 250);

    //println(returnedData.size());
    if( returnedData.size() == 0 ) {

      textFont(f);
      textAlign(CENTER);
      textLeading(45);
      text("장미와 만나기 전에 \n 손소독을 해주세요.",width/2,height/2); 

    } 
    else { 
        for(int i = 0; i<returnedData.size(); i++) {

        int y = (height/6 + (i+1)*80);
        textFont(busNumf);
        textAlign(LEFT);
        text(returnedData.get(i).busNum + "번",width/4,y);
        //println(returnedData.get(i).busNum); 
        textSize(20);
        text("B612 도착 "+ returnedData.get(i).time1 + "분 전" ,width/2,y-8);

      }
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
