class Star
{
  float xPos, yPos;
  
  public Star()
  {
    xPos = random(width);
    yPos = random(height);
  }
  
  void drawStar()
  {
    fill(255,255,150);
    circle(xPos,yPos,2);
  }
}
