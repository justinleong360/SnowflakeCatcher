Snowflake [] bob;

void setup()
{
  background(0,0,0);
  size(500,500);
  bob = new Snowflake[200];
  for(int i = 0; i<bob.length; i++)
  {
    int myX = (int)(Math.random()*500);
    int myY = (int)(Math.random()*500);
    bob[i] = new Snowflake(myX,myY);
  }
}

void draw()
{
  for(int i = 0; i<bob.length; i++)
  {
    bob[i].erase();
    bob[i].lookDown();
    bob[i].move();
    bob[i].wrap();
    bob[i].show();
  }
}

void mouseDragged()
{
  noStroke();
  fill(0,0,255);
  ellipse(mouseX,mouseY,8,8);
  if (mousePressed && (mouseButton == RIGHT)) 
  {
    fill(0,0,0);
    ellipse(mouseX,mouseY,15,15);
  }
}

class Snowflake
{
  int myX, myY;
  boolean isMoving;
  Snowflake(int x, int y)
  {
    myX = y;
    myY = x;
    isMoving = true;
  }
  void show()
  {
    fill(255,255,255);
    ellipse(myX, myY, 5, 5);
  }
  void lookDown()
  {
    if(myY>0 && myY<500 && get(myX,myY+5) == color(0,0,255))
    {
      isMoving = false;
    }
    else 
    {
      isMoving = true;
    }
  }
  void erase()
  {
    fill(0,0,0);
    ellipse(myX, myY, 7, 7);
  }
  void move()
  {
    if(isMoving == true)
    {
      myY = myY + 1;
    }
  }
  void wrap()
  {
    if(myY>498)
    {
      myY = 0;
      myX = (int)(Math.random()*500);
    }
  }
}


