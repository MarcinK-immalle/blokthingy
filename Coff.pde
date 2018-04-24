//.

class C {
  PGraphics blokCanvas;
  int size;
  int xcoord;
  int ycoord;
  int collision = 0;
  
  C(int s, int x, int y) {
    blokCanvas = createGraphics(s,s);
    blokCanvas.beginDraw();
    blokCanvas.fill(255);
    blokCanvas.noStroke();
    blokCanvas.rect(0, 0, s, s);
    blokCanvas.endDraw();
    
    size = s;
    xcoord = x;
    ycoord = y;
  }

  void blokUpd(int xc, int yc)
  {
    blokCanvas.clear();
    image(blokCanvas, xc, yc);
  }
  
  int rowblok = 0;
  int rowcanv = 0;
  
  void pixAr()
  {
    loadPixels();
    for(int i = 0 ; i <= size*size ; i++)
    {
      if(i%20==0){rowblok += 1;}
      blokCanvas.pixels[i] = blokCanvas.get(i-i*rowblok,rowblok);  
    }
      for(int i = 0 ; i <= width*height ; i++)
    {
      if(i % width == 0){rowcanv += 1;}
      pixels[i] = get(i-i*rowcanv,rowcanv);
    }
  }
  
  void checkArForOverrides()
  {
    for(int i = 0 ; i <= size*size ; i++)
    {
      if(blokCanvas.pixels[i] == 0)
        {
          collision = 1;
        }
        else
        {  
          collision = 0;
        }
    }
  }
  
  void fall(){
    if(collision == 0)
    {
      blok.blokUpd(xcoord, ycoord);
      ycoord += 10;
    }
  }
  
  void moveAndKeys()
  {
    if (keyPressed /*&& collision == 0*/) {
    if (key == 'q' || key == 'Q') 
      {
        blokUpd(xcoord,ycoord);
        xcoord -= 10;
      }
    else if(key == 'd' || key == 'D')
      {
        blokUpd(xcoord,ycoord);
        xcoord += 10;
      }
      else if(collision == 1 && key == 'z' || key == 'Z')
      {
        blokUpd(xcoord,ycoord);
        ycoord -= 20;
      }
    }
  }
  
  void update()
  {
    blokUpd(xcoord, ycoord);
    fall();
    //pixAr();
    //checkArForOverrides();
    moveAndKeys();
  }
}