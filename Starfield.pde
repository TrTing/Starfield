Particle[] particles;
void setup()
{
  size(500, 500); 
  particles = new Particle[500];
  for (int i=0; i <particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  particles[0] = new OddballParticle();
  particles[1]= new JumboParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < particles.length; i++)
  {
    particles [i].move();
    particles [i].show();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  int myColor;
  NormalParticle()
  {
    mySpeed= ((Math.random()*10)+1);
    myColor=color(random(256), random(256), random(256));
    myAngle=(Math.random()*(2*Math.PI));
    myX=250;
    myY=250;
  }
  public void move()
  {

    myX=(Math.cos(myAngle) * mySpeed)+myX;
    myY=(Math.sin(myAngle)* mySpeed)+ myY;
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float) myY, 10, 10);
  }
}
interface Particle
{
  public void show();
  public void move();
}

class OddballParticle implements Particle
{
  int myA=0;
  int myB=0;
  public void show()
  {
    fill(255, 0, 0);
    rect (myA, myB, 20, 20);
  }
  public void move()
  {
    myA= myA+5;
    myB= myB+5;
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill (255, 0, 0);
    ellipse ((float)myX, (float)myY, 30, 30);
  }
}
void mousePressed()
{
  redraw();
}
