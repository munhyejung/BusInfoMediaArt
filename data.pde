class data {

    JSONObject apiInfo;
    JSONObject busRouteInfo;

    StringDict isItGarage;

    private String[] busRoute = {"8","50-1","70","23-1","70-3","77-1","23","53","27","16","700","33","66","12-1","25","83"};
    ArrayList<BusInfo> busArray;

    data() {
        busArray = new ArrayList<BusInfo>();
    }

    void GetJson() {
        //json
        apiInfo = loadJSONObject("apiInfo.json");
        busRouteInfo = loadJSONObject("busCode.json");
        isItGarage = new StringDict();

    }


    String[] getBusRoute() {
        return busRoute;
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
    }

    //버스 T/F 확인 & 크기 확인
    //println(isItGarage);
    //println(busArray.size());

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
            정리 확인용
            println(busNum + "번 버스");
            println(time1 + "분 뒤 도착(" + location1 + "정거장 전)");
            println(time2 + "분 뒤 도착(" + location2 + "정거장 전)");
            println(time2.length());
            */
        }
    }

}