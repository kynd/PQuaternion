import peasy.*;
PeasyCam cam;

void setup() {
  size(640, 640, P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 300);
}

void draw() {
  background(128);
  stroke(255);
  
  float a = sin(frameCount * 0.02) * 90;
  tree(a, new PVector(width/2, height/2, 0), 
       new PVector(0, 0, 30), 
       new PVector(0, 0, 30), 
       new Quaternion(), 4);
}

void tree(float ang, PVector pos, PVector vec, PVector unit, Quaternion rot, int gen) {
    PVector nextPos = pos.get();
    nextPos.add(vec);
    line(pos.x, pos.y, pos.z, nextPos.x, nextPos.y, nextPos.z);
    if (gen > 0) {
        Quaternion xRot = new Quaternion();
        Quaternion zRot = new Quaternion(); 
        Quaternion rotNext = new Quaternion();
        for (int i = 0; i < 4; i ++) {
            xRot.setAngleAxis(radians(ang), new PVector(1, 0, 0));
            zRot.setAngleAxis(radians(90 * i + ang), new PVector(0, 0, 1));
            rotNext = xRot.mult(zRot).mult(rot);
            PVector vecNext = rotNext.mult(unit);
            tree(ang, nextPos, vecNext, unit, rotNext,gen - 1);
        }
    }
}
