class BusInfo {

    String time1;
    String time2;
    String loc1;
    String loc2;
    String busNum;

    int x,y;

    BusInfo(String busNum,String time1,String time2,String loc1,String loc2) {

        this.busNum = busNum;
        this.time1 = time1;
        this.time2 = time2;
        this.loc1 = loc1;
        this.loc2 = loc2;
    }

    void printInfo() {
        println(busNum, time1, time2, loc1, loc2);
    }

    void display(int x,int y) {

        if(  != null ) {
            text(busNum + "번 버스",x,y);
            text(time1 + "분 뒤 도착",x,y+20);
            text("("+loc1 + "정거장 전)",x+75,y+20);
        } else {
            text(busNum + "번 버스 차고지 대기 중",x,y);
        }

        //2번 버스 예외
        if(time2.length() != 0) {
            text(time2 + "분 뒤 도착",x,y+40);
            text("("+loc2 + "정거장 전)",x+75,y+40);
        } else {
            text(" ",x,y+40);
        }
        


    }

    
}