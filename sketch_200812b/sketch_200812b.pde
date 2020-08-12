void setup() {
  XML xml = loadXML("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?ServiceKey=bmyAYXE5rIj1is4FNuFX9Zt%2FRscDoEtrPYR%2FPyp9CxleMP8G1Cg3lLR3GHjMIO9TVXt0EeN8UkKkyuO3Op%2FWNA%3D%3D");
  XML[] body = xml.getChildren("body");
  XML[] items = body[0].getChildren("items");
  XML[] itemArray = items[0].getChildren("item");
  XML[] result = itemArray[itemArray.length - 1].getChildren("incDec");
  
  println(result.length);
  println(result[0].getContent());
}
