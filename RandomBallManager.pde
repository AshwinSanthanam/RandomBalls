class RandomBallManager
{
  Ball ball;
  ArrayList<Obstacle> obstacles;
  Obstacle currentObstacle;
  
  RandomBallManager(Ball ball, ArrayList<Obstacle> obstacles)
  {
    this.ball = ball;
    this.obstacles = obstacles;
    currentObstacle = null;
  }
  
  void Run()
  {
    Obstacle blocker = GetBlocker();
    if(blocker != null)
    {
      println("1");
      if(currentObstacle != blocker)
      {
        currentObstacle = blocker;
        ball.Bounce(blocker.GetAngle());  
      }        
    }
    else
    {
      currentObstacle = null;
    }
    ball.Move();
    stroke(255);
    fill(255);
    ball.Show();
    stroke(255, 0, 0);
    ShowObstacles();
  }
  
  void ShowObstacles()
  {
    for(Obstacle obstacle : obstacles)
    {
      obstacle.Show();
    }    
  }
  
  Obstacle GetBlocker()
  {
    float minDistance = Float.MAX_VALUE;
    Obstacle closest = null;
    for(Obstacle obstacle : obstacles)
    {
      CollisionDetector cd = new CollisionDetector(ball, obstacle);
      if(cd.DoesColloid())
      {
        if(cd.distance < minDistance)
        {
          minDistance = cd.distance;
          closest = obstacle;
        }
      }
    }
    return closest;
  }
}
