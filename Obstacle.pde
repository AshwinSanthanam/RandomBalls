class Obstacle
{
  private final PVector _p;
  private final PVector _q;
  
  public Obstacle(PVector p, PVector q)
  {
    _p = p;
    _q = q;
  }
  
  public void Show()
  {
    line(_p.x, _p.y, _q.x, _q.y);
  }
  
  public float GetA()
  {
    return _q.y - _p.y;
  }
  
  public float GetB()
  {
    return - _q.x + _p.x;
  }
  
  public float GetC()
  {
    return - _p.x * GetA() - _p.y * GetB();
  }
  
  public boolean IsWithin(PVector point)
  {
    return isWithinX(point) && isWithinY(point);
  }
  
  private boolean isWithinX(PVector point)
  {
    float x1 = max(_p.x, _q.x);
    float x2 = min(_p.x, _q.x);
    float x = point.x;
    return (x1 == x2) || (x <= x1 && x >= x2);
  }
  
  private boolean isWithinY(PVector point)
  {
    float y1 = max(_p.y, _q.y);
    float y2 = min(_p.y, _q.y);
    float y = point.y;    
    return (y1 == y2) || (y <= y1 && y >= y2);
  }
  
  private float GetAngle()
  {
    return atan2(_p.y - _q.y, _p.x - _q.x);
  }
}
