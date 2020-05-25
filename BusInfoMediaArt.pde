//Seperate Class that call data
Data data = new Data();
int paging = 6;
PFont f;


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

    fill(0);
    f = createFont("NotoSerifCJKkr-SemiBold.otf",45);
    textFont(f);

    //background
    first = new FirstScreen();
    second = new SecondScreen();
    third = new ThirdScreen();
    fourth = new FourthScreen();
    fifth = new FifthScreen();

    //first.setupFunction();
    //second.setupFunction();
    third.setupFunction();
    //fourth.setupFunction();
    //fifth.setupFunction();

    /*  글씨
    for(int i = 0; i<data.getBusArraySize();i++) {
        //paging
        int pageNum = i/paging;
        int listNum = i%paging;
        int x = 30 + pageNum*(width/4);
        int y = 40 + listNum*(height/paging);

        //차고지 예외 처리
        String tmpBusNum = data.getBusInfoWithIndex(i).busNum;
        
        if(data.getBusInfoWithIndex(i).isItGarage == false) {
            data.getBusInfoWithIndex(i).display(x,y);
        } 
        else {
            text( tmpBusNum + "번 버스 차고지 대기 중",x,y);
        }
    }   
    */

    //버스 확인용
    //displayInfos();

}

void draw() {

    //first.drawFunction();
    //second.drawFunction(data.getBusInfoWithScreen(1));
    try{ Thread.sleep(2000);}
    catch(Exception e){ println(e); }
    third.drawFunction(data.getBusInfoWithScreen(2));
    //fourth.drawFunction(data.getBusInfoWithScreen(3));
    //fifth.drawFunction();
}
