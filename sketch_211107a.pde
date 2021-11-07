PShape globe;
PImage earth;
/*
PVector yAxis = new PVector(0, 1, 0);
PVector zAxis = new PVector(0, 0, 1);

float rotation = 0;
*/

float estimateLon = 0;
float estimateLat = 0;
int time = 0;

void setup(){
size(600,600,P3D);

background(0);
  earth = loadImage("yCPyoZDQBBcXikqxkeW2jJ-1200-80.jpg");
  globe = createShape(SPHERE, 200); 
  globe.setTexture(earth);
  noStroke();

}

void draw(){
background(0);  
  
translate(width/2, height/2); 
  shape(globe);
 
JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=WGY5KR-ACE77B-WX75SV-4SRA");
JSONArray positionsJson = j.getJSONArray("positions");

JSONObject pos1 = positionsJson.getJSONObject(0);
JSONObject pos2 = positionsJson.getJSONObject(1);

float r = 220;

float sat1Lon = pos1.getFloat("satlongitude");
float sat1Lat = pos1.getFloat("satlatitude");
float sat2Lon = pos2.getFloat("satlongitude");
float sat2Lat = pos2.getFloat("satlatitude");
int unixTime = pos1.getInt("timestamp");

float theta = radians(sat1Lat);
float phi = radians(sat1Lon) + PI;

float x = r * cos(theta) * cos(phi);
float y = -r * sin(theta);
float z = -r * cos(theta) * sin(phi);

// sat1Londiff er forskellen mellem de to 'longitudes' fra n2yo API'en. Altså hvor meget longituden ændres hvert sekund


println(x,y,z);

pushMatrix();
translate(x, y, z);
box(20);
popMatrix();

textSize(10);
fill(255);
text("Time elapsed (seconds): "+unixTime, 130,220);
}
