//Seperate Class that call data
int paging = 6;
PFont f;

//소환해라 getjson, getbusroute, loadalldata, buscodeload

void setup() {
    size(600,1000);
    background(255);

    //글씨
    fill(0);
    f = createFont("NotoSerifCJKkr-ExtraLight.otf",12);
    textFont(f);

    for(int i = 0; i<busArray.size();i++) {
        //paging
        int pageNum = i/paging;
        int listNum = i%paging;
        int x = 30 + pageNum*(width/4);
        int y = 40 + listNum*(height/paging);

        //차고지 예외 처리
        String tmpBusNum = busArray.get(i).busNum;
        
        if( busArray.get(i).isItGarage == false) {
            busArray.get(i).display(x,y);
        } 
        else {
            text( tmpBusNum + "번 버스 차고지 대기 중",x,y);
        }
    }   

    //버스 확인용
    //displayInfos();

}

void draw() {
}

