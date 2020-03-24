PImage img;

void setup()
{
  size(1024, 512);
  img = loadImage("cat.jpg");
  img.filter(GRAY);
  image(img, 0, 0);
}

int index(int x, int y)
{
  return x+y*img.width;
}


void draw()
{

  img.loadPixels();
  for (int j=0; j<img.height-1; j++) {
    for (int i=1; i<img.width-1; i++) {


      color pix = img.pixels[index(i, j)];

      float r=red(pix);
      float g=green(pix);
      float b=blue(pix);

      int factor=1;

      int r1=(int)((round(factor*r/255))*(255/factor));
      int g1=(int)((round(factor*g/255))*(255/factor));
      int b1=(int)((round(factor*b/255))*(255/factor));
      img.pixels[index(i, j)]=color(r1, g1, b1);

      float er=r-r1;
      float eg=g-g1;
      float eb=b-b1;

      int index= index(i+1, j);
      color c= img.pixels[index];
      float r2= red(c);
      float g2=green(c);
      float b2=blue(c);
      r2=r2+er * 7/16.0;
      g2=g2+eg * 7/16.0;
      b2=b2+eb * 7/16.0;
      img.pixels[index]=color(r2, g2, b2);

      index= index(i-1, j+1);
      c= img.pixels[index];
      r2= red(c);
      g2=green(c);
      b2=blue(c);
      r2=r2+er * 3/16.0;
      g2=g2+eg * 3/16.0;
      b2=b2+eb * 3/16.0;
      img.pixels[index]=color(r2, g2, b2);
      
      
      index= index(i, j+1);
      c= img.pixels[index];
      r2= red(c);
      g2=green(c);
      b2=blue(c);
      r2=r2+er * 5/16.0;
      g2=g2+eg * 5/16.0;
      b2=b2+eb * 5/16.0;
      img.pixels[index]=color(r2, g2, b2);
      
      index= index(i+1, j+1);
      c= img.pixels[index];
      r2= red(c);
      g2=green(c);
      b2=blue(c);
      r2=r2+er * 1/16.0;
      g2=g2+eg * 1/16.0;
      b2=b2+eb * 1/16.0;
      img.pixels[index]=color(r2, g2, b2);
    }
  }
  img.updatePixels();
  image(img, 512, 0);
}
