Ball ball;
RandomBallManager manager;
ArrayList<Obstacle> obstacles;

void settings()
{
  size(500, 500);
  
  ball = new Ball(new PVector(250, 250), new PVector(3, 2), 10);
  obstacles = new ArrayList<Obstacle>();
  InitializeObstacles();
  manager = new RandomBallManager(ball, obstacles);
}

void InitializeObstacles()
{   
  obstacles.add(new Obstacle(new PVector(100, 100), new PVector(400, 100)));
  obstacles.add(new Obstacle(new PVector(400, 100), new PVector(400, 400)));
  obstacles.add(new Obstacle(new PVector(100, 400), new PVector(400, 400)));
  obstacles.add(new Obstacle(new PVector(100, 400), new PVector(100, 100)));
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
