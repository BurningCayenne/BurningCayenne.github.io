public class Star {
private int myX;
private int myY;
  public Star() {
  myX = (int)(Math.random()*1000);
  myY = (int)(Math.random()*1000);
  }
  
  public void show() {
  fill(255);
  ellipse(myX,myY,3,3);
  }
  
}
