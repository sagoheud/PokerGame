class Label extends Rect{
  Text text;
  
  Label(int x1, int  y1, int  x2, int  y2, color bg_col,color text_col, String str, int size){
    super(x1, y1, x2, y2, bg_col,text_col);
    text = new Text(x1,y1,x2,y2,text_col,str,size);
    if (str.contains("♠") || str.contains("♣")) {
      text.setColor(color(0, 0, 0));
    }
    else if (str.contains("♥") || str.contains("◈")) {
      text.setColor(color(255, 0, 0));
    }
    else if (str.contains("☆")) {
      text.setColor(color(0, 0, 0));
    }
    else if (str.contains("★")) {
      text.setColor(color(255, 0, 0));
    }
  }  
  
  void draw(){
    super.draw();
    text.draw();
    fill(bg_col);
  }
  void setString(String str){
    text.setString(str);
  }
}
