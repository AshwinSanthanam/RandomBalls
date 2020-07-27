class CollisionDetector
{
  private final Ball _ball;
  private final Obstacle _obstacle;
  public float distance;

  public CollisionDetector(Ball ball, Obstacle obstacle)
  {
    _ball = ball;
    _obstacle = obstacle;
  }

  public boolean DoesColloid()
  {
    float radius = _ball.GetRadius();
    float perpendicularDistance = GetPerpendicularDistance();

    distance = perpendicularDistance;
    float theta = _ball.GetDirectionAngle();
    float x = _ball.GetLocation().x + perpendicularDistance * cos(theta);
    float y = _ball.GetLocation().y + perpendicularDistance * sin(theta);
    
    if((perpendicularDistance <= radius) && _obstacle.IsWithin(new PVector(x, y)))
    {
      println("perpendicular distance : " + perpendicularDistance);
    }
    
    return (perpendicularDistance <= radius) && _obstacle.IsWithin(new PVector(x, y));
  }

  private float GetPerpendicularDistance()
  {
    PVector point = _ball.GetLocation();
    float a = _obstacle.GetA();
    float b = _obstacle.GetB();
    float c = _obstacle.GetC();

    float num = a * point.x + b * point.y + c;
    float den = sqrt(a * a + b * b);
    return abs(num / den);
  }
}
