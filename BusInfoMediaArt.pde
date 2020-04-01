JSONObject apiInfo;
JSONObject busRouteInfo;

void setup() {
    size(500,500);

    apiInfo = loadJSONObject("apiInfo.json");
    busRouteInfo = loadJSONObject("busCode.json");


    loadData();
    background(255);

    //JSONObject a = loadJSON("apiInfo.json");
    //a.apiBase + a.songnaeA;
}

void draw() {



}

//2번 버스, 차고지대기 예외처리 해야함

void loadData() {
    String url = apiInfo.getString("apiBase") + apiInfo.getString("songnaeA");

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

        if(location2 == " "){
            
            println(busNum + "번 버스");
            println(time1 + "분 뒤 도착(" + location1 + "정거장 전)");
            println(time2 + "분 뒤 도착(" + location2 + "정거장 전)");
        }        



    }

}

///////////////////////////////////////
//   23번 버스
//   5분 뒤 도착(3정거장 전)
//   10분 뒤 도착(5정거장 전)
///////////////////////////////////////
