class Ship
{
  float xPos, yPos;
  float xSpd, ySpd;
  boolean boosting, turningRight, turningLeft;
  float rotation;
  int fuel;
  
  public Ship( float x, float y )
  {
    xPos = x;
    yPos = y;
    xSpd = 0;
    ySpd = 0;
    fuel = 100;
    boosting = turningRight = turningLeft = false;
    rotation = 0;
  }
  
  void drawShip()
  {
    rectMode(CENTER);
    noStroke();
    translate( xPos, yPos );
    rotate( rotation * PI/180 );
    fill(255,0,0);
    triangle(0,-40,-30,0,30,0);
    fill(255);
    circle(0,-30,30);
    rect(0,0,30,60);
    triangle(0,25,-25,40,25,40);
    rotate( -rotation * PI/180);
    translate(-xPos, -yPos);
    rectMode(CORNER);
  }
  
  void rotateShip( float amount )
  {
    rotation += amount;
    if(rotation < 0)
      rotation += 360;
    if(rotation > 360)
      rotation -= 360;
  }
  
  void moveShip()
  {
    if(boosting)
    {
      addDirectionalSpeed();
      fuel -= 0.1;
    }
    if(turningRight)
    {
      rotateShip(3);
    }
    else if(turningLeft)
    {
      rotateShip(-3);
    }
    
    xPos += xSpd;
    yPos += ySpd;
    
    ySpd += 0.03;
  }
  
  void addDirectionalSpeed()
  {
    float xPercent = 0, yPercent = 0;
    float tempRotation = rotation;
    if( tempRotation <= 90 )
    {
      yPercent = 100 - ( 100 * tempRotation/90 );
      xPercent = 100 * tempRotation/90;
      
      yPercent = -yPercent;
    }
    else if( tempRotation <= 180 )
    {
      tempRotation %= 90;
      xPercent = 100 - ( 100 * tempRotation/90 );
      yPercent = 100 * tempRotation/90;
    }
    else if( tempRotation <= 270 )
    {
      tempRotation %= 90;
      yPercent = 100 - ( 100 * tempRotation/90 );
      xPercent = 100 * tempRotation/90;
      
      xPercent = -xPercent;
    }
    else
    {
      tempRotation %= 90;
      xPercent = 100 - ( 100 * tempRotation/90 );
      yPercent = 100 * tempRotation/90;
      
      xPercent = -xPercent;
      yPercent = -yPercent;
    }
    
    xSpd += 0.003 * xPercent;
    ySpd += 0.003 * yPercent;
  }
}
