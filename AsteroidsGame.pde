Spaceship joey;
boolean isAccelerating = false;
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;

int countDown = 60;
void setup()
{
  size(500, 500);
  joey = new Spaceship();
}
void draw()
{
  if (!isHyperspace)
  {
    background(0);
  } else
  {
    fill(0, 0, 0, 10);
    stroke(0, 0, 0, 10);
    rect(0, 0, width, height);
    countDown--;
    if (countDown == 0)
    {
      isHyperspace = false;
    }
  }
  if (keyPressed && key == '2') 
    countDown = 60;
  joey.show(isHyperspace, countDown, isAccelerating);
  joey.move();
  if (isAccelerating)joey.accelerate(.2);
  if (isRotatingLeft)joey.turn(-7);
  if (isRotatingRight)joey.turn(7);
  stroke(255);
}
void keyPressed()
{
  if (key == '5') isAccelerating = true;
  if (key == '4') isRotatingLeft = true;
  if (key == '6') isRotatingRight = true;
}
void keyReleased()
{
  if (key == '5') isAccelerating = false;
  if (key == '4') isRotatingLeft = false;
  if (key == '6') isRotatingRight = false;
}
