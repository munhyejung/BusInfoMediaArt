class PatientScreen {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color c1, c2;
  String patientNum;

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

    f = createFont("NotoSerifCJKkr-SemiBold.otf",28);

    XML xml = loadXML("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?ServiceKey=bmyAYXE5rIj1is4FNuFX9Zt%2FRscDoEtrPYR%2FPyp9CxleMP8G1Cg3lLR3GHjMIO9TVXt0EeN8UkKkyuO3Op%2FWNA%3D%3D");
    XML[] body = xml.getChildren("body");
    XML[] items = body[0].getChildren("items");
    XML[] itemArray = items[0].getChildren("item");
    XML[] result = itemArray[itemArray.length - 1].getChildren("incDec");
    patientNum = result[0].getContent();
    
    //image
    imageMode(CENTER);
    rightarrow = loadImage("right.png");
    leftarrow = loadImage("left.png");
    people = loadImage("people.png");
    hand = loadImage("hand.png");
    handPeople = loadImage("people-hand.png");
     
  }

  void drawFunction() {
    // Background
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);

    image(rightarrow,width-(width/18),height-(height/25),23,37);
    image(leftarrow,width/18,height-(height/25),23,37);

    image(people, width/4,height-150,130,130);
    image(hand, width/2-10,height-150,130,155);
    image(handPeople, width-width/4,height-150,180,150);

    textAlign(CENTER);
    textFont(f);
    fill(255);
    text("오늘의 환자수",width/2,height/8);
    text("전국 증가 환자 수 " + patientNum + "명",width/2,(height/4));

    text("주의해주세요",width/2, (height/2)-80);

    textSize(25);
    text("기침, 재채기할 때 옷소매로 입과 코 가리기",width/2, height-460);
    text("흐르는 물에 비누로 꼼꼼히 손 씻기",width/2, height-380);
    text("씻지 않은 손으로 눈,코,입 만지지 않기",width/2, height-300);
  
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
