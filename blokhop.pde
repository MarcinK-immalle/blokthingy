 C blok;

// Blok b1 = new Blok(20,50,50);
//lol

void setup(){
  size(1000,1000);
  background(155);
  frameRate(60);
  
  map();
  
  blok = new C(50,100,100);
}

void draw(){
    blok.update();
}

void map(){
  fill(0);
  rect(0,900,1000,100);
}