import damkjer.ocd.*;

Camera cam;
PShader cubemapShader; 
PMatrix3D matShader;
int offSetX;

void setup() { 
  size(800, 640, P3D); 
  frameRate(60);
  offSetX = 0;
  cam = new Camera(this, 0, 0, 180, 0, 0, 0);
  // Load cubemap shader. 
  cubemapShader = loadShader("cubemapfrag.glsl", "cubemapvert.glsl"); 
  matShader = new PMatrix3D();
}

void draw() {
  cam.feed();
  background(0); 
  //hint(DISABLE_OPTIMIZED_STROKE);
 
  box(0,100,100);
  pushMatrix();
  stroke(200,0,0);
  line(0,0,0,250,0,0);
  stroke(0,200,0);
  line(0,0,0,0,250,0);
  stroke(0,0,200);
  line(0,0,0,0,0,250);
  popMatrix();
  stroke(0,0,0);
  
  //Envoie de la matrice de camera inversé car les vertex envoyé dans le shader sont déjà multiplié par la matrice MV
  pushMatrix();
  translate(offSetX, 0, 0);
  shader(cubemapShader);
  PGraphics3D g3 = (PGraphics3D)g;
  matShader = g3.modelviewInv.get();
  cubemapShader.set("modelviewInv", matShader);
  box(50);
  popMatrix();
  resetShader(); 
}

void mouseMoved() {
  cam.circle(radians(mouseX - pmouseX));
}

void keyPressed(){
  if(keyCode == 39){
    offSetX ++;
  }
  else if(keyCode == 37){
    offSetX --;
  }
   
}