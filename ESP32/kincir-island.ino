#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <time.h>

const char *ssid = "Zn";  //Nama Wifi
const char *password = "zn123zn456"; // pass wifi
const char *host = "http://192.168.198.50:8080/kincir-island/";   //your IP/web server address
HTTPClient http;
//variabel data
const char* ntpServer = "pool.ntp.org";
const long  gmtOffset_sec = 25200;
const int   daylightOffset_sec = 3600;

uint32_t ctr = 1;
String waktuBaca,dataString="";
//uint8_t id = 1;   //id sensor
float wd, ws;
DynamicJsonDocument json(128);


void setup() {
  delay(1000);
  Serial.begin(115200);
  WiFi.mode(WIFI_OFF);        //Prevents reconnection issue (taking too long to connect)
  delay(1000);
  WiFi.mode(WIFI_STA);        //This line hides the viewing of ESP as wifi hotspot
  
  WiFi.begin(ssid, password);     //Connect to your WiFi router
  Serial.println("");
 
  Serial.print("Connecting");
  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
 
  //If connection successful show IP address in serial monitor
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());  //IP address assigned to your ESP

  // Init and get the time
  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);
}

void loop() {
  if(millis() % 1000 == 0){                // tiap 1 detik baca sensor
    setWaktu();
    readSensor();
    cekData();
    postData();
    clearVariable();                  // reset semua tampungan data ke 0
    delay(10);
    ctr++;
  }
}

void cekData(){
  Serial.print("data ke: "); Serial.println(ctr);
  Serial.print("Kecepatan Angin : "); Serial.print(ws); Serial.println(" m/s");
  Serial.print("Arah Angin : "); Serial.print(wd); Serial.println(" derajat");
  Serial.print("Timestamp : "); Serial.println(waktuBaca);
}
void setWaktu(){
  struct tm timeinfo;
  if(!getLocalTime(&timeinfo)){
    Serial.println("Failed to obtain time");
    return;
  }
  String tahun,bulan,hari,jam,menit,detik;
  tahun = (timeinfo.tm_year+1900);
  bulan = (timeinfo.tm_mon+1);
  hari = timeinfo.tm_mday;
  jam = timeinfo.tm_hour;
  menit = timeinfo.tm_min;
  detik = timeinfo.tm_sec;
  waktuBaca = tahun+"-"+bulan+"-"+hari+" "+jam+":"+menit+":"+detik;
}

void clearVariable(){
  ws = 0;
  wd = 0;
  dataString = "";
}

void readSensor(){
  float temp;
  //ambil data 10x terus buat rata2 dari 10 data
  for(int i=0;i<10;i++){
    temp = random(0,1000);
    temp = temp/10;
    ws += temp;
    temp = random(0,3600);
    temp = temp/10;
    wd += temp;
  }
  ws = ws/10;
  wd = wd/10;
}

void postData(){
  //prepare data
  String postData;
  String postAPI = (String)host+"api.php/";
//  json["id_sensor"] = id;
  json["wind_speed_sensor"] = ws;
  json["wind_direction_sensor"] = wd;
  json["timestamp_sensor"] = waktuBaca;
  //prepare request
  http.begin(postAPI);
  http.addHeader("Content-Type", "application/json");
  serializeJson(json, postData);
  Serial.print("POST data >> ");
  Serial.println(postData);
  int httpCode = http.POST(postData);
  String payload;
  if(httpCode > 0){
    payload = http.getString();
    payload.trim();
    if(payload.length() > 0){
      Serial.println(payload + "\n");
    }
  }
  http.end();
  json.clear();
}
