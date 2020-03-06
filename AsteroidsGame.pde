Spaceship s1 = new Spaceship();
ArrayList <Bullet> bull = new ArrayList <Bullet>(); 
Star[] stars;
ArrayList <Asteroid> ast; 
int score = 0;
int lives = 5;
int round = 1;
public void setup() 
{
  //your code here
  //background(0); 
  size(500, 500);
  ast = new ArrayList <Asteroid>();
  for (int i = 0; i < (int)(Math.random()*5 + 10); i++)
  {
    ast.add(new Asteroid((int)(Math.random()*500), (int)(Math.random()*500)));
  }
  stars = new Star[(int)(Math.random()*30 + 30)];
  for(int i = 0; i < stars.length; i++)
  {
    stroke(255);
    stars[i] = new Star((int)(Math.random()*500),(int)(Math.random()*500));
  }
  
}
boolean lpress = false;
boolean rpress = false;
boolean apress = false;
public void draw() 
{
  if(lives <= 0)
  {
    background(0);
    fill(255, 255, 255);
    
  }
  else
  {
    background(0);
    fill(255);
    
    s1.move();
    s1.show(); 
    for(int i = 0; i < ast.size(); i++)
    {
      ast.get(i).show();
      ast.get(i).move();
      ast.get(i).getX();
      ast.get(i).getY();
      int d = (int)dist(s1.getX(), s1.getY(), ast.get(i).getX(), ast.get(i).getY() );
      if(d < 25)
      {
        ast.remove(i);
       
        score = score + 100; 
      }
    }
    if(ast.size() == 0)
    {
      for (int i = 0; i < (int)(Math.random()*5 + 10); i++)
      ast.add(new Asteroid((int)(Math.random()*500), (int)(Math.random()*500)));
      round++;
    }
    for(int i = 0; i < stars.length; i ++){stars[i].show();}
    for(int i = 0; i < bull.size(); i++)
    {
      bull.get(i).show();
      bull.get(i).move();
  
      for(int nI = 0; nI < ast.size(); nI++)
      {
        int d = (int)dist(bull.get(i).getX(), bull.get(i).getY(), ast.get(nI).getX(), ast.get(nI).getY());
        if(d < 25)
        {
          ast.remove(nI);
          bull.remove(i);
          score = score + 100;
          break;
        }
      }
    }
  }
  if(rpress) s1.rotate(7);
  if(lpress) s1.rotate(-7);
  if(apress) s1.accelerate(.2);
}
public void keyPressed()
{
  if(key == '5') apress = true;
  if(key == '4') lpress = true;
  if(key == '6') rpress = true;
    
  if(key == ' ') bull.add( new Bullet());

}
public void keyReleased(){
  if(key == '5') apress = false;
  if(key == '4') lpress = false;
  if(key == '6') rpress = false;
}
public class Star
{
    int myX, myY;
    public Star(int x, int y)
    {
      myX = x;
      myY = y;
    }
    public void show()
    {
      ellipse(myX, myY, 2, 2);
      
    }
}
public class Bullet extends Floater
{
  double dRadians;
  public Bullet()
  {
    myColor = 255;
    corners = 1;
    myCenterX = s1.getX();
    myCenterY = s1.getY();
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = 0;
    myPointDirection = s1.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + s1.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) +s1.getDirectionY();
  }
  public void setX(int x){ myCenterX = x;}
  public int getX(){ return (int) myCenterX;}
  public void setY(int y){ myCenterY = y;}
  public int getY(){ return (int) myCenterY;}
  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX (){ return (double) myDirectionX; }
  public void setDirectionY(double y){ myDirectionY = y;}
  public double getDirectionY (){ return (double) myDirectionY; }
  public void setPointDirection( int degrees){ myPointDirection = degrees;}
  public double getPointDirection(){ return (int) myPointDirection; }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
  }
  public void show(){ellipse((int)myCenterX, (int)myCenterY, 2, 2);}

}
public class Spaceship extends Floater  
{   
    //your code here
  public Spaceship()
  {
    myColor = 255;
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -6;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -6;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myCenterX = 350;
    myCenterY = 350;
    myPointDirection = 0;
    myDirectionX = 0;
    myDirectionY = 0;
  }
    
  public void setX(int x){ myCenterX = x;}
  public int getX(){ return (int) myCenterX;}
  public void setY(int y){ myCenterY = y;}
  public int getY(){ return (int) myCenterY;}
  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX (){ return (double) myDirectionX; }
  public void setDirectionY(double y){ myDirectionY = y;}
  public double getDirectionY (){ return (double) myDirectionY; }
  public void setPointDirection( int degrees){ myPointDirection = degrees;}
  public double getPointDirection(){ return (int) myPointDirection; }

/*public void rocket()
{
  fill(255);
  line((float)myCenterX - 10, (float)myCenterY + 5, (float)myCenterX - 20, (float)myCenterY + 5);
  line((float)myCenterX - 10, (float)myCenterY, (float)myCenterX - 25, (float)myCenterY);
  line((float)myCenterX - 10, (float)myCenterY - 5, (float)myCenterX - 20, (float)myCenterY - 5);
}*/

}
public class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid(int x, int y)
  {
      rotSpeed = (int)(Math.random()*18-9);
      corners = 8;  
      xCorners = new int[corners];   
      yCorners = new int[corners];
      xCorners[0] = 26;
      yCorners[0] = 0;
      xCorners[1] = 12;
      yCorners[1] = 20;
      xCorners[2] = -6;
      yCorners[2] = 24;
      xCorners[3] = -22;
      yCorners[3] = 16;
      xCorners[4] = -18;
      yCorners[4] = 0;
      xCorners[5] = -22;
      yCorners[5] = -16;
      xCorners[6] = -2;
      yCorners[6] = -20;
      xCorners[7] = 14;
      yCorners[7] = -16;  
      myColor = 125;
      myCenterX = x;
      myCenterY = y; 
      myDirectionX = (int)(Math.random()*2 - 2);
      myDirectionY = (int)(Math.random()*2 - 2); 
      myPointDirection = Math.random()*360; 
  }

  public void setX(int x){ myCenterX = x;}
  public int getX(){ return (int) myCenterX;}
  public void setY(int y){ myCenterY = y;}
  public int getY(){ return (int) myCenterY;}
  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX (){ return (double) myDirectionX; }
  public void setDirectionY(double y){ myDirectionY = y;}
  public double getDirectionY (){ return (double) myDirectionY; }
  public void setPointDirection( int degrees){ myPointDirection = degrees;}
  public double getPointDirection(){ return (int) myPointDirection; }
  public void move()
  {
    if(myDirectionX == 0)
    {
      myDirectionX = 2 - Math.random()*2;
    }
    if(rotSpeed == 0){rotSpeed = (int)(Math.random()*18-9);}
    rotate(rotSpeed);
    //Floater.move();
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }  
  }     
  
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
