class Text extends DrawObj{
  String str;
  int size;
  color text_col;
  
  Text(int x1,int y1,int x2,int y2,color text_col,String str,int size){
    super(x1,y1,x2,y2);
    this.str=str; 
    this.size=size;
    this.text_col=text_col;
  }
  
  void setColor(color text_col) {
    this.text_col = text_col;
  }
  
  void draw(){
    textAlign(CENTER,CENTER);
    textSize(size);
    fill(text_col);
    text(str,getCenterX(),getCenterY());
  }

  void setString(String str){
    this.str=str;
  }
}
