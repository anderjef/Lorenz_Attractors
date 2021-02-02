//started 10/31/2020
//inspiration: https://www.youtube.com/watch?v=f0lkz2gSsIk&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=15
//a visual demonstration of Lorenz systems

import peasy.*;

float a = 10; //dx/dt system parameter
float b = 28; //dy/dt system parameter
float c = 8/3; //dz/dt system parameter
float dt = 0.01; //timestep
float x = 1, y = 1, z = 1; //starting coordinates of the particle
float dHue = 0.1; //how quickly the particle changes hue
int scale = 5; //how easy it is to zoom in on features; experimentally determined to be decent

ArrayList<PVector> points = new ArrayList<PVector>();
PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB); //HSB = hue, saturation, brightness
  cam = new PeasyCam(this, 500);
  noFill();
}

void draw() {
  background(0);
  x += (a * (y - x)) * dt;
  y += (x * (b - z) - y) * dt;
  z += (x * y - c * z) * dt;
  points.add(new PVector(x, y, z));
  
  scale(scale);
  beginShape();
  float hue = 0;
  for (PVector v : points) {
    stroke(hue, 255, 255);
    hue += dHue;
    hue %= 255;
    vertex(v.x, v.y, v.z);
  }
  endShape();
}
