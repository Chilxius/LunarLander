//Lunar Lander Game

Ship ship = new Ship(100,100);

int starCount = 100;
Star stars[] = new Star[starCount];

void setup()
{
  size(900,900);
  setupStars();
}

void draw()
{
  background(0);
  drawStars();
  drawGround();
  ship.moveShip();
  ship.drawShip();
}

void setupStars()
{
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
}

void drawStars()
{
  for(Star s: stars)
    s.drawStar();
}

void drawGround()
{
  noStroke();
  fill(90);
  rect(0,height-50,width,50);
}

void keyPressed()
{
  if( key == ' ' )
    ship.boosting = true;
  if( key == 'a' || key == 'A' )
    ship.turningLeft = true;
  if( key == 'd' || key == 'D' )
    ship.turningRight = true;
}

void keyReleased()
{
  if( key == ' ' )
    ship.boosting=false;
  if( key == 'a' || key == 'A' )
    ship.turningLeft = false;
  if( key == 'd' || key == 'D' )
    ship.turningRight = false;
}
