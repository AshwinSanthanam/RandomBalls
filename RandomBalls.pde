//Ball b;
//Obstacle o;
//CollisionDetector collisionDetector;
//void setup()
//{
//  size(500, 500);
//  b = new Ball(new PVector(500, 300), new PVector(-2, 1), 10);
//  o = new Obstacle(new PVector(0, 500), new PVector(500, 400));
//  collisionDetector = new CollisionDetector(b, o);
//}

//boolean colloid = false;

//void draw()
//{ 
//  background(0);
//  stroke(255);
//  fill(255);
//  b.Show();
//  o.Show();
//  if(!colloid && collisionDetector.DoesColloid())
//  {
//    colloid = true;
//    b.Bounce(o.GetAngle());
//  }
//  b.Move();
//}
