Ball ball;
RandomBallManager manager;
ArrayList<Obstacle> obstacles;

void settings()
{
  size(500, 500);
  
  ball = new Ball(new PVector(250, 75), new PVector(3, 2), 10);
  obstacles = new ArrayList<Obstacle>();
  //InitializeObstacles();
  CreateCircle(200, 0.125);
  CreateCircle(150, 0.125);
  manager = new RandomBallManager(ball, obstacles);
}

void InitializeObstacles()
{   
  obstacles.add(new Obstacle(new PVector(0, 0), new PVector(500, 0)));
  obstacles.add(new Obstacle(new PVector(500, 0), new PVector(500, 500)));
  obstacles.add(new Obstacle(new PVector(0, 500), new PVector(500, 500)));
  obstacles.add(new Obstacle(new PVector(0, 500), new PVector(0, 0)));
}

void CreateCircle(int r, float increment)
{
  float i = 0;
  float thickness = 1;
  float preX = 250 + r * cos(i * PI /180);
  float preY = 250 + r * sin(i * PI / 180);
  float preXX = 250 + (r + thickness) * cos(i * PI / 180);
  float preYY = 250 + (r + thickness) * sin(i * PI / 180);
  
  //  float x = 250 + r * cos(290 * PI /180);
  //  float y = 250 + r * sin(290 * PI /180);
  
  //float theta = atan((preY - y)/(preX - x));
  
  //obstacles.add(new Obstacle(new PVector(preX, preY), new PVector(250 + r * cos(theta), 250 + r * sin(theta))));
  
  for(; i <= 360; i += increment)
  {
    float angle = i * PI / 180.0;
    float x = 250 + r * cos(angle);
    float y = 250 + r * sin(angle);
    
    float xx = 250 + (r + thickness) * cos(angle);
    float yy = 250 + (r + thickness) * sin(angle);
    
    obstacles.add(new Obstacle(new PVector(preX, preY), new PVector(x, y)));
    obstacles.add(new Obstacle(new PVector(preXX, preYY), new PVector(xx, yy)));
    obstacles.add(new Obstacle(new PVector(x, y), new PVector(xx, yy)));
    
    preX = x;
    preY = y;
    preXX = xx;
    preYY = yy;
  }
  
}

boolean run = true;
void draw()
{
  if(run)
  {
    background(0);
    stroke(255);
    fill(255);  
    manager.Run();    
  }
}

void mousePressed()
{
  run = !run;
}
