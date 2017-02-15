/*
Name: Paavani Agrawal
 
THis project is of a hot air balloon that floats through the star filled sky that can move left and right using the “a” and “d” keys, grow and shrink using the “w” and “s” keys, and play “Sky Full of Stars” by Coldplay when the space bar is pressed.
 
 */

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage balloon;
float x=0;
float y=0;
float sizeX = 300;
float sizeY = 300;

Minim minim;
AudioPlayer ASkyFullofStars;
AudioInput input;


void setup()
{
  fullScreen();
  balloon = loadImage("balloon.png");
  // balloon = loadImage("up.png");
  x = width/2;
  y = height;
  minim = new Minim(this);
  ASkyFullofStars = minim.loadFile("ASkyFullOfStars.mp3");
  input = minim.getLineIn();
}


void draw()
{
  Stars();
  BalloonMove();
  MoveBalloon();
  keyPressed();
}


void BalloonMove()
{
  imageMode(CENTER);

  image(balloon, x, y, sizeX, sizeY);
  y = y-1;
  if (y<0-200)
  {
    y = height+200;
  }
}

void Stars()
{
  background(7, 0, 31);
  for (int i=0; i<300; i++) 
  {
    fill(random(255));
    stroke(7, 0, 31);
    ellipse(random(width), random(height), 5, 5);
  }
}

void MoveBalloon()
{
  if (keyPressed)
  {
    if (key == 'd')
    {
      x = x+5;
    }
    if (key == 'a')
    {
      x = x-5;
    }
    if (key == 'w')
    {
      sizeX = sizeX + 10;
      sizeY = sizeY + 10;
    }
    if (key == 's')
    {
      sizeX = sizeX - 10;
      sizeY = sizeY - 10;
    }
  }
}

void keyReleased()
{
 if(key == ' ')
 {
  ASkyFullofStars.play(); 
 }
}