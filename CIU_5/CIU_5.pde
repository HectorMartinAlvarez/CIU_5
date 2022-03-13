import java.util.List;
import java.util.ArrayList;

PImage img;
PImage icon_deselected;
PImage icon_selected;
PImage help;
PImage bRental;
PImage bReturn;
PImage[] icons = new PImage[32];

String[] stations = {"Plaza Manuel Becerra","Autoridad portuaria", "Castillo de la Luz","Torre Woermann","C.C. El Muelle","Las Canteras - Luis Morote", 
"Parque Santa Catalina","Plazoleta de Farray","Plaza de España", "Base Naval","Churruca", "Mercado Central", "IES Mesa y López", "Plaza del Pilar", 
"Intermodal El Rincón","C.C. La Minilla", "Paseo de Chil - Av. Escaleritas", "Ayuntamiento", "Piscina Julio Navarro", "Muelle Deportivo",
"Oficina de la Sitycleta", "Plaza O'Shanahan", "Canódromo","Obelisco","Castillo de Mata (elect.)","Cabildo de Gran Canaria", "San Telmo", 
"San Bernardo", "Teatro Pérez Galdós", "San Cristóbal","C.C. La Ballena (elect.)", "Plaza San Agustín"}; 

Table data;

List<Bicycle> selected = new ArrayList<Bicycle>();

float X = 0;
float Y = 0;
float XN = 0;
float YN = 0;
float XD = 0;
float YD = 0;
int index = 0;
int inter = 0;

boolean loaded = false;
int lastS = -1;
boolean cl = false;

float l = 1.0;

void setup() {
  size(1100,800);
  img = loadImage("data/map.png");
  icon_deselected = loadImage("data/icon.jpg");
  icon_selected = loadImage("data/icon_selected.jpg");
  help = loadImage("data/help.jpg");
  bRental = loadImage("data/rental.png");
  bReturn = loadImage("data/return.png");
  data = loadTable("data/SITYCLETA-2021.csv","header");
  deselect();
}

void draw() {
  background(255);
  pushMatrix();
  scale(l,l);
  image(img, X, Y, 700, 800);
  image(icons[0], X+470,Y,15,15);
  image(icons[1], X+520,Y+50,15,15);
  image(icons[2], X+400,Y+20,15,15);
  image(icons[3], X+355,Y+70,15,15);
  image(icons[4], X+390,Y+130,15,15);
  image(icons[5], X+275,Y+130,15,15);
  image(icons[6], X+355,Y+140,15,15);
  image(icons[7], X+270,Y+190,15,15);
  image(icons[8], X+275,Y+240,15,15);
  image(icons[9], X+365,Y+230,15,15);
  image(icons[10], X+200,Y+240,15,15);
  image(icons[11], X+310,Y+255,15,15);
  image(icons[12], X+215,Y+300,15,15);
  image(icons[13], X+130,Y+310,15,15);
  image(icons[14], X+70,Y+320,15,15);
  image(icons[15], X+235,Y+370,15,15);
  image(icons[16], X+280,Y+380,15,15);
  image(icons[17], X+380,Y+390,15,15);
  image(icons[18], X+360,Y+440,15,15);
  image(icons[19], X+430,Y+420,15,15);
  image(icons[20], X+430,Y+440,15,15);
  image(icons[21], X+425,Y+480,15,15);
  image(icons[22], X+290,Y+580,15,15);
  image(icons[23], X+440,Y+585,15,15);
  image(icons[24], X+475,Y+660,15,15);
  image(icons[25], X+505,Y+655,15,15);
  image(icons[26], X+545,Y+640,15,15);
  image(icons[27], X+510,Y+700,15,15);
  image(icons[28], X+590,Y+710,15,15);
  image(icons[29], X+540,Y+740,15,15);
  image(icons[30], X+170,Y+760,15,15);
  image(icons[31], X+610,Y+780,15,15);
  popMatrix();
  fill(255);
  rect(700,0, 500, 1200);
  image(help, width-50,1,50,50);
  fill(0);
  println(mouseX);
  println(mouseY);
  if(cl){
    if(!loaded) selectBicycles();
    image(icon_deselected, 730,45,50,50);
    textSize(20);
    text(stations[lastS],800, 80);
    textSize(24);
    triangle(767,155,891,115,1015,155);
    triangle(767,725,891,765,1015,725);
    for(int i = index; i < (index+7) && i < selected.size();i++){
      Bicycle a = selected.get(i);
      if(a.type == 0){
        image(bRental, 730,180+inter,50,50);
        text(a.start, 800, 200+inter);
        text(a.id, 800, 230+inter);
      }else if(a.type == 1){
        image(bReturn, 730,180+inter,50,50);
        text(a.start, 800, 200+inter);
        text(a.id, 800, 230+inter);
      }
      inter += 80;
    }
    inter = 0; //<>//
  }else{
    textSize(24);
    text("Select a station",750, 400);
    image(icon_deselected, 950,370,50,50);
  }
  println(index);
}

void deselect(){
 for(int i = 0; i < icons.length; i++){
    icons[i] = icon_deselected.copy();
  } 
}

void selectBicycles(){
  
  String rental;
  String ret;
  
  for (TableRow row : data.rows()) {
    rental = row.getString("Rental place"); //<>//
    ret = row.getString("Return place");
    if(rental.equals(stations[lastS])){
      Bicycle temp = new Bicycle(row.getString("Start"),row.getString("End"),rental,ret,int(random(10000,99999)));
      temp.setType(0);
      selected.add(temp);
    }else if(ret.equals(stations[lastS])){
      Bicycle temp = new Bicycle(row.getString("Start"),row.getString("End"),rental,ret,int(random(10000,99999)));
      temp.setType(1);
      selected.add(temp);
    }
  }
  loaded = true;
}

void mouseClicked(){
  if(mouseX < 700){
    selection();
  }
  if(mouseX > 767 && mouseY < 155 && mouseX < 1015 && mouseY > 115){
    if(loaded){
      if(index < selected.size()-1){
        index++;
      }
    }
  }
  if(mouseX > 767 && mouseY > 725 && mouseY < 765 && mouseX < 1015){
    if(index > 0){
      index--;
    }
  }
  if(mouseX > width-50 && mouseY < 50){
    new Help();
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
    XD = mouseX-XN;
    YD = mouseY-YN;
  }
}

void mouseReleased(){
  if(mouseX < 700){
    X += XD;
    Y += YD;
  }
  XD = 0;
  YD = 0;
}

void mouseWheel(MouseEvent event){
  float e = event.getCount();
  if(e < 0){
    l+=0.2;
  }else{
    l-=0.2;
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
      break;
    case 'w':
    case 'W':
      if(loaded){
        if(index < selected.size()-1){
          index++;
        }
      }
      break;
    case 's':
    case 'S':
      if(index > 0){
        index--;
      }
      break;  
 }
}