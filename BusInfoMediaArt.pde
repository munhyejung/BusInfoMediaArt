JSONObject apiInfo;
JSONObject busRouteInfo;

PFont f;

ArrayList<BusInfo> busArray = new ArrayList<BusInfo>();

void setup() {
    size(600,700);

    //json
    apiInfo = loadJSONObject("apiInfo.json");
    busRouteInfo = loadJSONObject("busCode.json");

    loadAllData();
    background(255);

    //글씨
    fill(0);
    f = createFont("NanumBarunGothicUltraLight.ttf",14);
    
    displayInfos();
    
    for(int i = 0; i<busArray.size();i++) {
        int x = 30;
        int y = 30 + i*75;
        busArray.get(i).display(x,y);


    }
    
}

void draw() {

}

void loadAllData() {
    loadData(apiInfo.getString("songnaeA"));
    loadData(apiInfo.getString("songnaeB"));
    loadData(apiInfo.getString("songnaeC"));
}

//2번 버스, 차고지대기 예외처리 해야함
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

        /*
        //확인용
        println(busNum + "번 버스");
        println(time1 + "분 뒤 도착(" + location1 + "정거장 전)");
        println(time2 + "분 뒤 도착(" + location2 + "정거장 전)");
        */
    }

}

void displayInfos() {
    for(int i = 0; i<busArray.size(); i++) {
        busArray.get(i).printInfo();
    }
}