import peasy.*;

PShader cubemapShader; 
PeasyCam cam;
PMatrix3D matShader;

void setup() { 
  size(800, 640, P3D); 
  frameRate(60);

  // Load cubemap shader. 
  cubemapShader = loadShader("cubemapfrag.glsl", "cubemapvert.glsl"); 
  cam = new PeasyCam(this, width/2, height/2, 0, 180);
  cam.setYawRotationMode(); 
  matShader = new PMatrix3D();
}

void draw() { 
  background(0); 
  hint(DISABLE_OPTIMIZED_STROKE);
 

  //Envoie de la matrice de camera inversé car les vertex envoyé dans le shader sont déjà multiplié par la matrice MV
  pushMatrix();
  translate(width/2,height/2,0);
  shader(cubemapShader);
  PGraphics3D g3 = (PGraphics3D)g;
  matShader = g3.modelviewInv.get();
  matShader.transpose();
  matShader.print();
  cubemapShader.set("matShader", matShader);
  box(50);
  popMatrix();
  resetShader(); 
  //hint(ENABLE_OPTIMIZED_STROKE);
}
