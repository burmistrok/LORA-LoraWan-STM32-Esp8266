#include <LoRa.h>
#include <SPI.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#define ss 15
#define rst 16
#define dio0 4

String inString = "";    // string to hold input

const char *ssid =  "TP-LINK_77915A";  // 
const char *pass =  "******"; // 


const char *mqtt_server = "broker.mqttdashboard.com"; // Имя сервера MQTT
const int mqtt_port = 1883; // Порт для подключения к серверу MQTT
const char *mqtt_user = "TestLora"; // Логин от сервер
const char *mqtt_pass = "12345"; // Пароль от сервера
const String device_name = "test705";//имя  device_name
int counter = 0;
unsigned int i_delay = 10u;

#define BUFFER_SIZE 100

WiFiClient wclient;      
PubSubClient client(wclient, mqtt_server, mqtt_port);


void callback(const MQTT::Publish& pub){
     String payload = pub.payload_string();
}

void setup() {
  Serial.begin(115200);
  while (!Serial);

  Serial.println("LoRa Receiver");

  LoRa.setPins(ss, rst, dio0);

  if (!LoRa.begin(433E6)) {
    Serial.println("Starting LoRa failed!");
    while (1);
  }

}

void loop() {

// подключаемся к wi-fi
  if (WiFi.status() != WL_CONNECTED) {
    Serial.print("Connecting to ");
    Serial.print(ssid);
    Serial.println("...");
    WiFi.begin(ssid, pass);

    if (WiFi.waitForConnectResult() != WL_CONNECTED)
      return;
    Serial.println("");
     Serial.println("WiFi connected");
     Serial.println("IP address: ");
     Serial.println(WiFi.localIP());
  }

  // подключаемся к MQTT серверу
  if (WiFi.status() == WL_CONNECTED) {
    if (!client.connected()) {
      Serial.println("Connecting to MQTT server");
      if (client.connect(MQTT::Connect(device_name)
                         .set_auth(mqtt_user, mqtt_pass))) {
        Serial.println("Connected to MQTT server");
        client.set_callback(callback);
        //client.subscribe("test/led"); // подписывааемся по топик с данными для светодиода
      } else {
        Serial.println("Could not connect to MQTT server");   
      }
    }

    if (client.connected()){
      client.loop();
  }


   if (1u <= i_delay--)
   {
    ;
   }
   else
   {
    char temp[20];    
    sprintf(temp,"%d",counter);
     client.publish("LoraGateway/Counter",temp);    //pulse of gateway for check
     counter++;
     i_delay = 32000;
   }
     //delay(10000);

}

       // try to parse packet
  int packetSize = LoRa.parsePacket();
  if (packetSize) { 
    // read packet    
    while (LoRa.available())
    {
      int inChar = LoRa.read();
      inString += (char)inChar;      
    }
    
    LoRa.packetRssi();    
  }
  if (inString.length() != 0)
      {
        client.publish("ElectricMeter/dev1/Indications",inString);
        Serial.println(inString);  
        inString = ""; 
      }
///////////////////////////////////////////////////////////////

} // конец основного цикла
