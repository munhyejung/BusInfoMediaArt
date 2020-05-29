//Seperate Class that call data
import processing.sound.*;
SoundFile file;

/*
Grisaia no Rakuen OST - Flowers, Blooming Side by Side
Gin no Saji Silver Spoon - Main Theme
브금대통령(BgmPresident) - Memory Of Spring
태연 - 11:11 inst
f(x) - 미행 inst
*/

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

    file = new SoundFile(this,"지구에는 항상 꽃이 피어나지.mp3");
    file.play();
    file.loop();

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
