class Ball
{
  private PVector _location;
  private PVector _velocity;
  private final float _radius;

  public Ball(PVector location, PVector velocity, float radius)
  {
    _location = location;
    _velocity = velocity;
    _radius = radius;
  }

  public void Show()
  {
    ellipse(_location.x, _location.y, _radius * 2, _radius * 2);
    
  }

  public void Move()
  {
    _location.add(_velocity);
  }

  public float GetRadius()
  {
    return _radius;
  }

  public PVector GetLocation()
  {
    return _location;
  }

  public void Stop()
  {
    _velocity.sub(_velocity);
  }

  public float GetDirectionAngle()
  {
    return atan2(_velocity.y, _velocity.x);
  }

  public void Bounce(float bounceAngle)
  {
    float directionAngle = GetDirectionAngle();

    println("directionAngle : " + (directionAngle * 180 / PI));
    println("bounceAngle : " + (bounceAngle * 180 / PI));    

    if (directionAngle < 0) directionAngle += 2 * PI;
    if (bounceAngle < 0) bounceAngle += 2 * PI;

    println("velocity : " +  _velocity);
    println("directionAngle : " + (directionAngle * 180 / PI));
    println("bounceAngle : " + (bounceAngle * 180 / PI));

    float theta = bounceAngle + PI + (bounceAngle - directionAngle);

    while (theta > 2 * PI)
    {
      theta -= 2 * PI;
    }

    println("theta : " + (theta * 180 / PI));
    float speed = sqrt(_velocity.x * _velocity.x + _velocity.y * _velocity.y);   

    _velocity = new PVector(-speed * cos(theta), -speed * sin(theta));
    println("velocity : " +  _velocity);
  }
}
