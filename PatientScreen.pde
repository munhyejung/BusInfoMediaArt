class PatientScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;
  PFont busNumf;
  PImage littlePrince;
  PImage B612;
  PImage rightarrow;

  void setupFunction() {
    
    //grgradient color
    c1 = color(218, 71, 22);
    c2 = color(0, 0, 42);

    fill(255);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",28);
    busNumf = createFont("NotoSerifCJKkr-SemiBold.otf",35);
    
    //image
    imageMode(CENTER);
    littlePrince = loadImage("Second.png");
    B612 = loadImage("Second2.png");
    rightarrow = loadImage("right.png");

  }

  void drawFunction(ArrayList<BusInfo> returnedData) {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    textFont(f);
    text("행복해지기 전",width/2,height/8);

    image(B612,width/2,1150,814,829);
    image(littlePrince, width/10, 850, 78, 246);
    image(rightarrow,width-(width/18),height-(height/25),23,37);

    //println(returnedData.size());     
    if( returnedData.size() == 0 ) {
      textFont(f);
      textAlign(CENTER);
      textLeading(45);
      text("떠나기 전에 마스크를 꼭 착용해주세요.",width/2,height/2);
    } 
    else {
      for(int i = 0; i<returnedData.size(); i++) {
        int y = (height/6 + (i+1)*80);
        textFont(busNumf);
        textAlign(LEFT);
        
        text(returnedData.get(i).busNum + "번",width/4,y);
        //println(returnedData.get(i).busNum);
        textSize(20);
        text("장미와 이야기 하는 중",width/2,y-11);
        textSize(15);
        text("차고지 대기",width/2,(15+y)-6);
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
