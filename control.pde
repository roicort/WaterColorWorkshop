
import controlP5.*;
ControlP5 ctrlp5;
ColorPicker cp;
Slider slider;
Slider Rslider;
Slider Gslider;
Slider Bslider;
Button button;
Button savebutton;
Button autobutton;
Toggle walkersbutton;

void Control(){
  ctrlp5 = new ControlP5(this);
  Rslider = ctrlp5.addSlider("R").setSize(200,25).setPosition(25,100).setMax(255).setValue(0);
  Gslider = ctrlp5.addSlider("G").setSize(200,25).setPosition(25,200).setMax(255).setValue(0);
  Bslider = ctrlp5.addSlider("B").setSize(200,25).setPosition(25,300).setMax(255).setValue(0);
  slider = ctrlp5.addSlider("Size").setSize(200,25).setPosition(25,400).setMax(1.0).setValue(0.5);
  button = ctrlp5.addButton("Clear").setSize(200,25).setPosition(25,500);
  savebutton = ctrlp5.addButton("Save").setSize(200,25).setPosition(25,535);
  autobutton = ctrlp5.addButton("Auto").setSize(200,25).setPosition(25,570);
  walkersbutton = ctrlp5.addToggle("Walkers").setSize(200,25).setPosition(25,605);
 }
 
 public void controlEvent(ControlEvent c) {
  if(c.isFrom(Rslider)) {
     r = int(c.getValue());
  }
    if(c.isFrom(Gslider)) {
     g = int(c.getValue());
  }
    if(c.isFrom(Bslider)) {
     b = int(c.getValue());
  }
  if(c.isFrom(button)) {
    background(255);
    auto=false;
    walkersbutton.setValue(0);
    system = new ArrayList<water>();
  }
  if(c.isFrom(savebutton)) {
    saveFrame("saved/watercolor####.png");
  }
  if(c.isFrom(autobutton)) {
    selectInput("Select a file to process:", "fileSelected");
  }
}
