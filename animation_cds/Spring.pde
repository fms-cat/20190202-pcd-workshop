class Spring {
  float position = 0.0;
  float velocity = 0.0;
  float target = 0.0;
  float springFactor = 100.0;
  float dampRatio = 1.0;
  
  void reset() {
    position = 0.0;
    velocity = 0.0;
    target = 0.0;
  }
  
  void update(float deltaTime) {
    velocity += (-springFactor * (position - target) - 2.0 * velocity * sqrt(springFactor)) * deltaTime;
    position += velocity * deltaTime;
  }
}
