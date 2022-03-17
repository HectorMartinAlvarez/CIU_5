import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

PImage img;
PImage icon_deselected;
PImage icon_selected;
PImage help;
PImage bRental;
PImage bReturn;
PImage[] icons = new PImage[32];

Filter filtro = new Filter(true);

String[] stations = {"Plaza Manuel Becerra","Autoridad portuaria", "Castillo de la Luz","Torre Woermann","C.C. El Muelle","Las Canteras - Luis Morote", 
"Parque Santa Catalina","Plazoleta de Farray","Plaza de España", "Base Naval","Churruca", "Mercado Central", "IES Mesa y López", "Plaza del Pilar", 
"Intermodal El Rincón","C.C. La Minilla", "Paseo de Chil - Av. Escaleritas", "Ayuntamiento", "Piscina Julio Navarro", "Muelle Deportivo",
"Oficina de la Sitycleta", "Plaza O'Shanahan", "Canódromo","Obelisco","Castillo de Mata (elect.)","Cabildo de Gran Canaria", "San Telmo", 
"San Bernardo", "Teatro Pérez Galdós", "San Cristóbal","C.C. La Ballena (elect.)", "Plaza San Agustín"}; 

Map<String, float[]> locations = new HashMap<String, float[]>();

Table data;

List<Bicycle> station = new ArrayList<Bicycle>();
List<Bicycle> selected = new ArrayList<Bicycle>();

float X = 0;
float Y = 0;
float XN = 0;
float YN = 0;
float XD = 0;
float YD = 0;
int index = 0;
int inter = 0;
float rentN0 = 0;
float rentN1 = 0;
float retN0 = 0;
float retN1 = 0;
float rentD0 = 0;
float rentD1 = 0;
float retD0 = 0;
float retD1 = 0;

boolean loaded = false;
int lastS = -1;
boolean cl = false;
boolean press = false;

color[] col = new color[7];

float l = 1.0;

float[] a = {X+470,Y};
float[] a1 = {X+520,Y+50};
float[] a2 = {X+400,Y+20};
float[] a3 = {X+355,Y+70};
float[] a4 = {X+390,Y+130};
float[] a5 = {X+275,Y+130};
float[] a6 = {X+355,Y+140};
float[] a7 = {X+270,Y+190};
float[] a8 = {X+275,Y+240};
float[] a9 = {X+365,Y+230};
float[] b = {X+200,Y+240};
float[] b1 = {X+310,Y+255};
float[] b2 = {X+215,Y+300};
float[] b3 = {X+130,Y+310};
float[] b4 = {X+70,Y+320};
float[] b5 = {X+235,Y+370};
float[] b6 = {X+280,Y+380};
float[] b7 = {X+380,Y+390};
float[] b8 = {X+360,Y+440};
float[] b9 = {X+430,Y+420};
float[] c1 = {X+430,Y+440};
float[] c2 = {X+425,Y+480};
float[] c3 = {X+290,Y+580};
float[] c4 = {X+440,Y+585};
float[] c5 = {X+475,Y+660};
float[] c6 = {X+505,Y+655};
float[] c7 = {X+545,Y+640};
float[] c8 = {X+510,Y+700};
float[] c9 = {X+590,Y+710};
float[] d = {X+540,Y+740};
float[] d1 = {X+170,Y+760};
float[] d2 = {X+610,Y+780};

float[] rent = {0,0};
float[] ret = {0,0};

void setup() {
  size(1100,800);
  img = loadImage("data/map.png");
  icon_deselected = loadImage("data/icon.jpg");
  icon_selected = loadImage("data/icon_selected.jpg");
  help = loadImage("data/help.jpg");
  bRental = loadImage("data/rental.png");
  bReturn = loadImage("data/return.png");
  data = loadTable("data/SITYCLETA-2021.csv","header");
  insertMap();
  deselect();
  for(int i = 0; i< col.length; i++){
    col[i] = color(255);
  }
}

void draw() { //<>//
  background(255);
  pushMatrix();
  scale(l,l);
  image(img, X, Y, 700, 800);
  image(icons[0], X+470,Y,30,30);
  image(icons[1], X+520,Y+50,30,30);
  image(icons[2], X+400,Y+20,30,30);
  image(icons[3], X+355,Y+70,30,30);
  image(icons[4], X+390,Y+130,30,30);
  image(icons[5], X+275,Y+130,30,30);
  image(icons[6], X+355,Y+140,30,30);
  image(icons[7], X+270,Y+190,30,30);
  image(icons[8], X+275,Y+240,30,30);
  image(icons[9], X+365,Y+230,30,30);
  image(icons[10], X+200,Y+240,30,30);
  image(icons[11], X+310,Y+255,30,30);
  image(icons[12], X+215,Y+300,30,30);
  image(icons[13], X+130,Y+310,30,30);
  image(icons[14], X+70,Y+320,30,30);
  image(icons[15], X+235,Y+370,30,30);
  image(icons[16], X+280,Y+380,30,30);
  image(icons[17], X+380,Y+390,30,30);
  image(icons[18], X+360,Y+440,30,30);
  image(icons[19], X+430,Y+420,30,30);
  image(icons[20], X+430,Y+440,30,30);
  image(icons[21], X+425,Y+480,30,30);
  image(icons[22], X+290,Y+580,30,30);
  image(icons[23], X+440,Y+585,30,30);
  image(icons[24], X+475,Y+660,30,30);
  image(icons[25], X+505,Y+655,30,30);
  image(icons[26], X+545,Y+640,30,30);
  image(icons[27], X+510,Y+700,30,30);
  image(icons[28], X+590,Y+710,30,30);
  image(icons[29], X+540,Y+740,30,30);
  image(icons[30], X+170,Y+760,30,30);
  image(icons[31], X+610,Y+780,30,30);
  popMatrix();
  fill(255);
  rect(700,0, 500, 1200);
  image(help, width-50,1,50,50);
  fill(0);
  if(cl){
    if(!loaded) selectBicycles();
    image(icon_deselected, 702,1,50,50);
    textSize(19);
    text(stations[lastS],758, 35);
    fill(230);
    rect(825,55, 130, 50);
    fill(0);
    text("Filters",860, 85);
    textSize(24);
    triangle(767,155,891,115,1015,155);
    triangle(767,725,891,765,1015,725);
    fill(col[0]);
    rect(700, 170, 400, 70);
    fill(col[1]);
    rect(700, 250, 400, 70);
    fill(col[2]);
    rect(700, 330, 400, 70);
    fill(col[3]);
    rect(700, 410, 400, 70);
    fill(col[4]);
    rect(700, 490, 400, 70);
    fill(col[5]);
    rect(700, 570, 400, 70);
    fill(col[6]);
    rect(700, 650, 400, 70);
    fill(0);
    if(!press)drawGradientLine(rent[0]*l,rent[1]*l, ret[0]*l, ret[1]*l);
    strokeWeight(1);
    stroke(0);
    for(int i = index; i < (index+7) && i < station.size();i++){
      Bicycle a = station.get(i);
      if(a.type == 0){
        image(bRental, 730,180+inter,50,50);
        text("Rented", 800, 200+inter);
        text(a.startDay+"/"+a.startMonth+"/"+a.startYear+" "+a.startTime, 800, 230+inter);
        inter += 80;
      }
      if(a.type == 1){
        image(bReturn, 730,180+inter,50,50);
        text("Returned", 800, 200+inter);
        text(a.endDay+"/"+a.endMonth+"/"+a.endYear+" "+a.endTime, 800, 230+inter);
        inter += 80;  
      }
    }
    inter = 0; //<>//
  }else{
    textSize(24);
    text("Select a station",750, 400);
    image(icon_deselected, 950,370,50,50);
  }
  if(press){
   moveMap(); 
  }
}

void deselect(){
 for(int i = 0; i < icons.length; i++){
    icons[i] = icon_deselected.copy();
  } 
}

void applyFilter(){
  station.clear();
  for(int i = 0; i < col.length; i++){
    col[i] = color(255);
  }
  rent[0] = 0;
  rent[1] = 0;
  ret[0] = 0;
  ret[1] = 0;
  for(int i = 0; i < selected.size();i++){
      Bicycle a = selected.get(i);
      if(a.startDay < (filtro.dayFrom == -1 ? -1 : filtro.dayFrom)){ continue;}
      if(a.startMonth < (filtro.monthFrom == -1 ? -1 : filtro.monthFrom)){ continue;}
      if(a.startYear < (filtro.yearFrom == -1 ? -1 : filtro.yearFrom)){  continue;}
      if(a.endDay > (filtro.dayTo == 32 ? 32 : filtro.dayTo)){  continue;}
      if(a.endMonth > (filtro.monthTo == 13 ? 13 : filtro.monthTo)){  continue;}
      if(a.endYear > (filtro.yearTo == 3000 ? 3000 : filtro.yearTo)){  continue;}
      if(filtro.rented){
        if(a.type == 0){
          station.add(a);
        }
      }
      if(filtro.returned){
        if(a.type == 1){
          station.add(a);
        }
      }
  }
}

void selectBicycles(){
  
  String rental;
  String ret;
  station.clear();
  boolean isValid = false;
  for (TableRow row : data.rows()) {
    isValid = false;
    rental = row.getString("Rental place"); //<>//
    for(int i = 0; i < stations.length; i++){
      if(rental.equals(stations[i])){
        isValid = true;
        break; 
      }
    }
    if(!isValid)continue;
    isValid = false;
    ret = row.getString("Return place");
    for(int i = 0; i < stations.length; i++){
      if(ret.equals(stations[i])){
        isValid = true;
        break; 
      }
    }
    if(!isValid)continue;
    if(rental.equals(stations[lastS])){
      Bicycle temp = new Bicycle(row.getString("Start"),row.getString("End"),rental,ret);
      temp.setType(0);
      selected.add(temp);
    }else if(ret.equals(stations[lastS])){
      Bicycle temp = new Bicycle(row.getString("Start"),row.getString("End"),rental,ret);
      temp.setType(1);
      selected.add(temp);
    }
  }
  loaded = true;
  applyFilter();
}

void drawGradientLine(float start_X, float start_Y, float end_X, float end_Y) 
{
  int numSegs = 300;
  color c1 = color(255,0,0);
  color c2 = color(0,255,0);

  for(int i = 0; i < numSegs; i++)
  {
    float tA = i/float(numSegs);
    float tB = (i+1)/float(numSegs);  
    
    float xA = lerp(start_X, end_X, tA);  
    float yA = lerp(start_Y, end_Y, tA); 
    
    float xB = lerp(start_X, end_X, tB);     
    float yB = lerp(start_Y, end_Y, tB); 
    strokeWeight(5);
    stroke(lerpColor(c2, c1, tA));
    line(xA, yA, xB, yB);
  }
}

void mouseClicked(){
  if(mouseX < 700){
    selection();
  }
  if(mouseX > 767 && mouseY < 155 && mouseX < 1015 && mouseY > 115){
    if(index > 0){
      index--;
    }
    for(int i = 0; i < col.length; i++){
        col[i] = color(255);
      }
      rent[0] = 0;
      rent[1] = 0;
      ret[0] = 0;
      ret[1] = 0;
  }
  if(mouseX > 767 && mouseY > 725 && mouseY < 765 && mouseX < 1015){
    if(loaded){
      if(index < selected.size()-1){
        index++;
      }
      for(int i = 0; i < col.length; i++){
        col[i] = color(255);
      }
      rent[0] = 0;
      rent[1] = 0;
      ret[0] = 0;
      ret[1] = 0;
    }
  }
  if(mouseX > width-50 && mouseY < 50){
    new Help(true);
  }
  if(mouseX > 825 && mouseX < 955 && mouseY > 55 && mouseY < 105 ){
    filtro.setVisible(true);
  }
  if(mouseX > 700 && mouseY > 170 && mouseY < 240){
    for(int i = 0; i < col.length; i++){
      if(i == 0) continue;
      col[i] = color(255);
    }
    col[0] = #ACE9DF;
    Bicycle a = station.get(index);
    rent = locations.get(a.rental);
    ret = locations.get(a._return);
  }else if(mouseX > 700 && mouseY > 250 && mouseY < 320){
      for(int i = 0; i < col.length; i++){
        if(i == 1) continue;
        col[i] = color(255);
      }
      col[1] = #ACE9DF;
      Bicycle a = station.get(index+1);
      rent = locations.get(a.rental);
      ret = locations.get(a._return);
  }else if(mouseX > 700 && mouseY > 330 && mouseY < 400){
    for(int i = 0; i < col.length; i++){
      if(i == 2) continue;
      col[i] = color(255);
    }
    col[2] = #ACE9DF;
    Bicycle a = station.get(index+2);
    rent = locations.get(a.rental);
    ret = locations.get(a._return);
  }else if(mouseX > 700 && mouseY > 410 && mouseY < 480){
    for(int i = 0; i < col.length; i++){
      if(i == 3) continue;
      col[i] = color(255);
    }
    col[3] = #ACE9DF;
    Bicycle a = station.get(index+3);
    rent = locations.get(a.rental);
    ret = locations.get(a._return);
  }else if(mouseX > 700 && mouseY > 490 && mouseY < 560){
    for(int i = 0; i < col.length; i++){
      if(i == 4) continue;
      col[i] = color(255);
    }
    col[4] = #ACE9DF;
    Bicycle a = station.get(index+4);
    rent = locations.get(a.rental);
    ret = locations.get(a._return);
  }else if(mouseX > 700 && mouseY > 570 && mouseY < 640){
    for(int i = 0; i < col.length; i++){
      if(i == 5) continue;
      col[i] = color(255);
    }
    col[5] = #ACE9DF;
    Bicycle a = station.get(index+5);
    rent = locations.get(a.rental);
    ret = locations.get(a._return);
  }else if(mouseX > 700 && mouseY > 650 && mouseY < 720){
    for(int i = 0; i < col.length-1; i++){
      col[i] = color(255);
    }
    col[6] = #ACE9DF;
    Bicycle a = station.get(index+6);
    rent = locations.get(a.rental);
    ret = locations.get(a._return);
  }
}

void mousePressed(){
  if(mouseX < 700){
    XN = mouseX;
    YN = mouseY;
  }
  
}

void mouseDragged(){
  if(mouseX < 700){
    X += XD;
    Y += YD;
  }
  press = true;
}

void mouseReleased(){
  if(mouseX < 700){
    X += XD;
    Y += YD;
  }
  XD = 0;
  YD = 0;
  updateStation();
  updateMap();
  press = false;
}

void moveMap(){
  XD = (mouseX-XN)/80;
  YD = (mouseY-YN)/80;
}

void mouseWheel(MouseEvent event){
  if(mouseX < 700){
    float e = event.getCount();
    if(e < 0){
      l+=0.2;
    }else{
      l-=0.2;
    }
  }
}

void keyPressed(){
 switch(key){
    case 'r':
    case 'R':
      l = 1.0;
      X = 0;
      Y = 0;
      XN = 0;
      YN = 0;
      for(int i = 0; i < col.length; i++){
        col[i] = color(255);
      }
      rent = new float[2];
      ret = new float[2];
      filtro.dayFrom = -1;
      filtro.dayTo = 32;
      filtro.monthFrom = -1;
      filtro.monthTo = 32;
      filtro.yearFrom = -1;
      filtro.yearTo = 3000;
      filtro.rented = true;
      filtro.returned  = true;  
      filtro.jCheckBox1.setSelected(true);
      filtro.jCheckBox2.setSelected(true);
      filtro.jTextField1.setText("");
      filtro.jTextField2.setText("");
      filtro.jTextField3.setText("");
      filtro.jTextField4.setText("");
      filtro.jTextField5.setText("");
      filtro.jTextField6.setText("");
      deselect();
      cl = false;
      break;
    case 'w':
    case 'W':
      if(index > 0){
        index--;
      }
      for(int i = 0; i < col.length; i++){
        col[i] = color(255);
      }
      rent[0] = 0;
      rent[1] = 0;
      ret[0] = 0;
      ret[1] = 0;
      break;
    case 's':
    case 'S':
      if(loaded){
        if(index < selected.size()-1){
          index++;
        }
      }
      for(int i = 0; i < col.length; i++){
        col[i] = color(255);
      }
      rent[0] = 0;
      rent[1] = 0;
      ret[0] = 0;
      ret[1] = 0;
      break;
 }
}
