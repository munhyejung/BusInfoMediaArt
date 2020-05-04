JSONObject apiInfo;
JSONObject busRouteInfo;

int paging = 6;
PFont f;
StringDict isItGarage;
String[] busRoute = {"8","50-1","70","23-1","70-3","77-1","23","53","27","16","700","33","66","12-1","25","83"};

ArrayList<BusInfo> busArray = new ArrayList<BusInfo>();

void setup() {
    size(1080,1920);

    //json
    apiInfo = loadJSONObject("apiInfo.json");
    busRouteInfo = loadJSONObject("busCode.json");
    isItGarage = new StringDict();

    busCodeLoad();
    loadAllData();
    background(255);
    noLoop();

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
    FirstScreen s1 = new FirstScreen();
    s1.drawBackground();
}

void busCodeLoad() {
    for(int i = 0; i<busRoute.length; i++) {
        isItGarage.set(busRoute[i],"TRUE");
    }
}


void loadAllData() {
    loadData(apiInfo.getString("songnaeA"));
    loadData(apiInfo.getString("songnaeB"));
    loadData(apiInfo.getString("songnaeC"));

    

    for(int i = 0; i<busRoute.length; i++) {
        if( isItGarage.get(busRoute[i]) == "TRUE") {
            BusInfo tmp = new BusInfo(busRoute[i]);
            busArray.add(tmp);
        }
    }

    //버스 T/F 확인
    //println(isItGarage);

    //크기 확인
    //println(busArray.size());

}

void loadData(String stationCode) {
    String url = apiInfo.getString("apiBase") + stationCode;

    XML xml = loadXML(url);
    XML body = xml.getChild("msgBody");
    XML[] Bus = body.getChildren("busArrivalList");

    for(int i = 0 ; i<Bus.length;i++) {
        String time1 = Bus[i].getChild("predictTime1").getContent();
        String time2 = Bus[i].getChild("predictTime2").getContent();
        String location1 = Bus[i].getChild("locationNo1").getContent();
        String location2 = Bus[i].getChild("locationNo2").getContent();
        //bus num
        String busId = Bus[i].getChild("routeId").getContent();
        String busNum = busRouteInfo.getString(busId);

        //arraylist
        BusInfo tmp = new BusInfo(busNum,time1,time2,location1,location2);
        busArray.add(tmp);
        isItGarage.set(busNum,"FALSE");

        /*
        //정리 확인용
        println(busNum + "번 버스");
        println(time1 + "분 뒤 도착(" + location1 + "정거장 전)");
        println(time2 + "분 뒤 도착(" + location2 + "정거장 전)");
        println(time2.length());
        */
    }

}

void displayInfos() {
    for(int i = 0; i<busArray.size(); i++) {
        busArray.get(i).printInfo();
    }
}
