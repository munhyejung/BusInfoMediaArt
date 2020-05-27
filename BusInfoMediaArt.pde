//Seperate Class that call data
Data data = new Data();
boolean thirdPageStart = true;
int currentPage = 1;

FirstScreen first;
SecondScreen second;
ThirdScreen third;
FourthScreen fourth;
FifthScreen fifth;


void setup() {
    size(600,1000);
    background(255);

    data.getJson();
    data.loadAllData();

    //background
    first = new FirstScreen();
    second = new SecondScreen();
    third = new ThirdScreen();
    fourth = new FourthScreen();
    fifth = new FifthScreen();

    first.setupFunction();
    second.setupFunction();
    third.setupFunction();
    fourth.setupFunction();
    fifth.setupFunction();

}

void draw() {

    //page
    switch (currentPage) {
        case 1:
          first.drawFunction();
          break;
        case 2:
          second.drawFunction(data.getBusInfoWithScreen(1));
          break;
        case 3:
          if(thirdPageStart == false ){
            try{ Thread.sleep(2000);}
            catch(Exception e){ println(e); }
          }
          third.drawFunction(data.getBusInfoWithScreen(2));
          thirdPageStart = false;
          break;
        case 4:
          fourth.drawFunction(data.getBusInfoWithScreen(3));
          break;
        case 5:
          fifth.drawFunction();
          break;
    }
}

//button
void keyPressed() {
    if (key == CODED) {
        if(keyCode == RIGHT) {
            currentPage++;
            thirdPageStart = true;
        }

        if(keyCode == LEFT) {
          currentPage--;
          thirdPageStart = true;
        }
    }
}
