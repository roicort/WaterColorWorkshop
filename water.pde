

class water {
  
  PShape s;
  float x, y;
  float velx,vely;
  float yoff = 0;
  color col;
  float size;
  
  // We are using an ArrayList to keep a duplicate copy
  // of vertices original locations.
  ArrayList<PVector> original;

  water() {
    x = width/2;
    y = height/2; 

    // The "original" locations of the vertices make up a circle
    original = new ArrayList<PVector>();
    for (float a = 0; a < TWO_PI; a+=0.2) {
      PVector v = PVector.fromAngle(a);
      v.mult(100);
      original.add(v);
    }
  }
  
  boolean IsIN(){
    boolean True = true;
    boolean False = false;
    if((x > width) || (y < 0)){
      return False;}
    if((y > height) || (y < 0)){
      return False;}
     else{
       return True;}
  }
    
  void move(){
    velx = velx+random(-0.1,0.1);
    vely = vely+random(-0.1,0.1);
    x = x + velx;
    y = y + vely;   
  }

  void display(float xp, float yp) {
    
    //Now make the PShape with those vertices
    s = createShape();
    s.beginShape();
    //s.noFill();
    s.fill(col);
    s.noStroke();
    //s.strokeWeight(2);
    for (PVector v : original) {
      s.vertex(v.x, v.y);
    }
    s.endShape(CLOSE);
    float xoff = 0;
    // Apply an offset to each vertex
    for (int i = 0; i < s.getVertexCount(); i++) {
      // Calculate a new vertex location based on noise around "original" location
      PVector pos = original.get(i);
      float a = TWO_PI*noise(xoff,yoff);
      PVector r = PVector.fromAngle(a);
      r.mult(16);
      r.add(pos);
      // Set the location of each vertex to the new one
      s.setVertex(i, r.x, r.y);
      // increment perlin noise x value
      xoff+= 0.5;
    }
    // Increment perlin noise y value
    yoff += 0.02;
    
    pushMatrix();
    translate(xp, yp);
    scale(size);
    shape(s);
    popMatrix();
  }
  
PShape getshape() {
    
    //Now make the PShape with those vertices
    s = createShape();
    s.beginShape();
    //s.noFill();
    s.fill(col);
    s.noStroke();
    //s.strokeWeight(2);
    for (PVector v : original) {
      s.vertex(v.x, v.y);
    }
    s.endShape(CLOSE);
    float xoff = 0;
    // Apply an offset to each vertex
    for (int i = 0; i < s.getVertexCount(); i++) {
      // Calculate a new vertex location based on noise around "original" location
      PVector pos = original.get(i);
      float a = TWO_PI*noise(xoff,yoff);
      PVector r = PVector.fromAngle(a);
      r.mult(16);
      r.add(pos);
      // Set the location of each vertex to the new one
      s.setVertex(i, r.x, r.y);
      // increment perlin noise x value
      xoff+= 0.5;
    }
    // Increment perlin noise y value
    yoff += 0.02;
    
    return s;
  }
}
