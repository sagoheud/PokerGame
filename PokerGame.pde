Table main = null;
Table now = null;

void setup() {
  size(720, 720);
  PFont font;
  font = createFont("Gulim",32);
  textFont(font);
  main = new MainTable();
  now = main;
  main.draw();
  noLoop();
  
  //Cards ca = new Cards(true);
  //ca.showAll();
  //ca.print(); // 나눠주고 남은 덱 표시된다.
}

void mouseClicked()
{ 
  now.onClick(mouseX,mouseY);
  loop();
}

void draw() {
  now.draw();
}
