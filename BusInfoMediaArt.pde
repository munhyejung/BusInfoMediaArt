JSONObject apiInfo;
JSONObject busRouteInfo;

PFont f;

StringDict isItGarage;

ArrayList<BusInfo> busArray = new ArrayList<BusInfo>();
ArrayList<Integer> list = new ArrayList<Integer>();

void setup() {
    size(900,900);

    //json
    apiInfo = loadJSONObject("apiInfo.json");
    busRouteInfo = loadJSONObject("busCode.json");

    loadAllData();
    background(255);

    //글씨
    fill(0);
    f = createFont("NanumBarunGothicUltraLight.ttf",14);

    isItGarage = new StringDict();

    isItGarage.set("busCode","TRUE");
    isItGarage.get("busCode");

    //true 뜨면 번호 + "차고지 대기 중"
    
    for(int i = 0; i<busArray.size();i++) {
        //paging
        int pageNum = i/6;
        int listNum = i%6;
        int x = 30 + pageNum*(width/4);
        int y = 40 + listNum*(height/6);
        busArray.get(i).display(x,y);

        //차고지 예외 처리
        Iterator<Integer> itr = list.iterator();
        while(itr.hasNext()) {
            list.get( itr.next() );

        }

        if(isItGarage.get("busCode") == "TRUE") {
            text( "번 버스 차고지 대기 중",x,y);
        }
    }   
    //버스 확인용
    //displayInfos();
}

void draw() {
}

void loadAllData() {
    loadData(apiInfo.getString("songnaeA"));
    loadData(apiInfo.getString("songnaeB"));
    loadData(apiInfo.getString("songnaeC"));

    println(busArray.size());
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
        isItGarage.replace(busId,"FALSE");

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