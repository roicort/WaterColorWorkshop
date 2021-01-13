water W;
float size;

ArrayList<water> system;

PImage img;
PGraphics autowater;

float r = 0;
float g = 0;
float b = 0;

String file;
Boolean auto = false;

void setup() {
  fullScreen();
  background(255);
  W = new water();
  Control();
  noStroke();
  system = new ArrayList<water>();
}

void draw() {
  if(auto){
    int x = int(random(img.width));
    int y = int(random(img.height));
    color auxcol = img.get(x, y);
    
    r = red(auxcol);
    g = green(auxcol);
    b = blue(auxcol);
    
    println(r,g,b);
    
    Rslider.setValue(r);
    Gslider.setValue(g);
    Bslider.setValue(b);
    
    fill(r,g,b);
    rect(0,0,(width/6)+25,height);
    
    autowater.beginDraw();
    W.col=color(r,g,b,10);
    PShape watershape = W.getshape();
    autowater.pushMatrix();
    autowater.translate(x, y);
    autowater.scale(slider.getValue()*0.09);
    autowater.shape(watershape);
    autowater.popMatrix();
    autowater.endDraw();
    imageMode(CENTER);
    image(autowater,(width/6)+25+((width-(width/6))/2), height/2);
  }
  if(walkersbutton.getValue()==1){
    fill(r,g,b);
    rect(0,0,(width/6)+25,height);
      for(water ps : system){
    if(ps.IsIN()){
    ps.display(ps.x, ps.y);
    ps.move();
    }
  }
  }
  else{
    fill(r,g,b);
    rect(0,0,(width/6)+25,height);
    //background(cp.getColorValue());
    if (mousePressed == true && mouseX > (width/6)+25) {  
      W.size = slider.getValue();
      W.col=color(r,g,b,5);
      W.display(mouseX,mouseY);
     }
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    file = selection.getAbsolutePath();
    img = loadImage(file);
    autowater = createGraphics(img.width, img.height);
    auto=true;
  }
}

void mousePressed(){
  if(walkersbutton.getValue()==1){
  if (mouseX > (width/6)+25){
   for(int i=0; i < 10; i++){
      water aux = new water();
      aux.x = mouseX;
      aux.y = mouseY;
      aux.size = slider.getValue();
      aux.col=color(r,g,b,5);
      system.add(aux);
    }
  }
}
}
