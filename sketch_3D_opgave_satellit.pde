PShape globe;
PImage earth;

void setup(){
size(600,600,P3D);
background(0);
  earth = loadImage("Earth.JPG5a55ca7f-1d7c-41d7-b161-80501e00d095Larger.jpg");
  globe = createShape(SPHERE, 200); 
  globe.setTexture(earth);
  noStroke();

}

void draw(){
  
translate(width/2, height/2); 
  shape(globe);
 
JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=WGY5KR-ACE77B-WX75SV-4SRA");
JSONArray positionsJson = j.getJSONArray("positions");

JSONObject pos1 = positionsJson.getJSONObject(0);
JSONObject pos2 = positionsJson.getJSONObject(1);

float r = 10;
float r2 = 250;

float sat1Lon = pos1.getFloat("satlongitude");
float sat1Lat = pos1.getFloat("satlatitude");
float sat2Lon = pos2.getFloat("satlongitude");
float sat2Lat = pos2.getFloat("satlatitude");
float theta1 = radians(sat1Lat);
float phi1 = radians(sat1Lon) + PI;
float theta2 = radians(sat2Lat);
float phi2 = radians(sat2Lon);

float positionx1 = r2 * cos(theta1);
float positiony1 = r2 * sin(theta1);

println(positionx1,positiony1,0);
}
