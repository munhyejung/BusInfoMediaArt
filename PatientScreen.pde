class PatientScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;

  PFont f;

  PImage rightarrow;
  PImage leftarrow;
  PImage people;
  PImage hand;
  PImage handPeople;

  void setupFunction() {
    
    //grgradient color
    c1 = color(16, 30, 55);
    c2 = color(106, 106, 106);

    fill(255);
    f = createFont("NotoSerifCJKkr-SemiBold.otf",28);

    XML xml = loadXML("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?ServiceKey=bmyAYXE5rIj1is4FNuFX9Zt%2FRscDoEtrPYR%2FPyp9CxleMP8G1Cg3lLR3GHjMIO9TVXt0EeN8UkKkyuO3Op%2FWNA%3D%3D");
    XML[] children = xml.getChildren("incDec");

    println(children[children.length - 1]);
    
    //image
    imageMode(CENTER);
    rightarrow = loadImage("right.png");
    leftarrow = loadImage("left.png");
    /*
    poeple = loadImage("people.png");
    hand = loadImage("hand.png");
    handpoeple = loadImage("handpeople.png");
     */
     
  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    textAlign(CENTER);
    textFont(f);
    text("오늘의 환자수",width/2,height/8);

    



    text("전국 증감 환자 수 " +  + "명",width/2,(height/2)-300);


    text("주의해주세요",width/2, (height/2)-100);
    textSize(25);
    text("기침, 재채기할 때 옷소매로 입과 코 가리기",width/2, height-400);
    text("흐르는 물에 비누로 꼼꼼히 손 씻기",width/2, height-450);
    text("씻지 않은 손으로 눈,코,입 만지지 않기",width/2, height-350);
  
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
