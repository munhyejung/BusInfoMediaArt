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

    //1,5번 그대로 2~4번

    
    
        ArrayList<BusInfo> returnedData = data.getBusInfoWithScreen(1);
        for(int i = 0; i<returnedData.size(); i++) {
            println(returnedData.get(i).busNum);
        }


    //글씨
    /*
    fill(0);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",12);
    textFont(f);

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

    

}

