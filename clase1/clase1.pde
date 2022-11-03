// ciclo de vida se traslada a processing 

float escala = 0;
float rotacion = 0;

void setup() {
  size(800, 800, P3D);
  stroke(255);
  noFill();
}

void draw() {
  
  background(0);
  
  // traslacion
  float tx = width/2;
  float ty = height/2;
  float tz = 0;
  PMatrix3D translation = new PMatrix3D(1, 0, 0, tx,
                                        0, 1, 0, ty,
                                        0, 0, 1, tz,
                                        0, 0, 0, 1);
                                        
                                       
  float sx = escala;
  float sy = escala;
  float sz = escala;
  PMatrix3D scale = new PMatrix3D(sx, 0,  0,  0,
                                  0,  sy, 0,  0,
                                  0,  0,  sz, 0,
                                  0,  0,  0,  1);
                                        
                                        
  float anguloZ = radians(rotacion);
  PMatrix3D rotationZ = new PMatrix3D(cos(anguloZ), -sin(anguloZ), 0, 0,
                                      sin(anguloZ), cos(anguloZ),  0, 0,
                                      0,            0,             1, 0,
                                      0,            0,             0, 1);
                                  
  // aquí es cuando ya afecta
  // EL ORDEN DE OPERACIONES VA INVERTIDO EN PROCESSING
  
  
  applyMatrix(rotationZ);
  applyMatrix(translation);
  
  // dibujo directo
  // (ya no existe en versiones recientes de opengl)
  beginShape();
  vertex(-50, -50);
  vertex(50, -50);
  vertex(50, 50);
  vertex(-50, 50);
  endShape(CLOSE);
  escala += 0.01f;
  rotacion += 1f;
}
