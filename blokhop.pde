 C blok;

// Blok b1 = new Blok(20,50,50);

void setup(){
  size(500,500);
  frameRate(60);
  
  map();
  
  blok = new C(50,200,200);
}

void draw(){
    blok.update();
}

void map(){
  fill(0);
  rect(0,900,1000,100);
}