//Seperate Class that call data
import processing.sound.*;
import processing.video.*;
SoundFile file;

Data data = new Data();
boolean thirdPageStart = true;
int currentPage = 1;

/*
FirstScreen first;
SecondScreen second;
ThirdScreen third;
FourthScreen fourth;
FifthScreen fifth;
CameraBeforeScreen camerabefore;
CameraScreen camera;
Capture cam;
*/
PatientScreen patient;

/*
지구에는 항상 꽃이 피어나지(flower)
지구에는 항상 태양이 비추다(sun)
Side by Side
Main Theme  밝은 거
*/

void setup() {
    size(600,1000);
    background(255);

  /*
    data.getJson();
    data.loadAllData();

    file = new SoundFile(this,"flower.wav");
    file.play();
    file.loop();
    */

    //background
    /*
    first = new FirstScreen();
    second = new SecondScreen();
    third = new ThirdScreen();
    fourth = new FourthScreen();
    fifth = new FifthScreen();
    camerabefore = new CameraBeforeScreen();
    cam = new Capture(this, 1280, 720);
    camera = new CameraScreen(cam);
    */
    patient = new PatientScreen();

    /*
    first.setupFunction();
    second.setupFunction();
    third.setupFunction();
    fourth.setupFunction();
    fifth.setupFunction();
    camerabefore.setupFunction();

    */
    patient.setupFunction();

}

void draw() {
    //page
    /*
    switch (currentPage) {
        case 1:
          first.drawFunction();
          break;
        case 2:
          camerabefore.drawFunction();
          break;
        case 3:
          camera.drawFunction();
          break;
        case 4:
          
          break;
        case 5:
          second.drawFunction(data.getBusInfoWithScreen(1));
          break;
        case 6:
          if(thirdPageStart == false ){
            try{ Thread.sleep(2000);}
            catch(Exception e){ println(e); }
          }
          third.drawFunction(data.getBusInfoWithScreen(2));
          thirdPageStart = false;
          break;
        case 7:
          fourth.drawFunction(data.getBusInfoWithScreen(3));
          break;
        case 8:
          fifth.drawFunction();
          break;
    }
    */

    patient.drawFunction();

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

void captureEvent(Capture c) {
  c.read();
}