class Spaceship extends Floater
{
  public Spaceship() {
    corners = 3;
    xCorners = new int[corners];
    xCorners[0] = 16;
    xCorners[1] = -8;
    xCorners[2] = -8;
    yCorners = new int[corners];
    yCorners[0] = 0;
    yCorners[1] = 8;
    yCorners[2] = -8;
    myColor = color(255, 255, 255);
    myCenterX = myCenterY = 250; //holds center coordinates
    myXspeed = myYspeed = 0; //holds x and y coordinates of the vector for direction of travel
    myPointDirection = 0;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myXspeed = x;
  }
  public double getDirectionX() {
    return myXspeed;
  }
  public void setDirectionY(double y) {
    myYspeed = y;
  }
  public double getDirectionY() {
    return myYspeed;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void show (boolean isHyperspace, int countDown, boolean jets)
  {  
    //Draws the floater at the current position
    if (isHyperspace == false)
    {
      fill(myColor);
      stroke(myColor);
    } else
    {
      fill(255, 255, 255, 60 - countDown);
      stroke(255, 255, 255, 60 - countDown);
    }
    //convert degrees to radians for sin and cos     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    translate((float)myCenterX, (float)myCenterY);
    rotate(dRadians);
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }

    endShape(CLOSE);

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
