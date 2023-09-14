class Button extends Label{
  String id;
  
  Button(int x1, int  y1, int  x2, int  y2, color bg_col, color text_col, String str, int size, String id){
    super(x1, y1, x2, y2, bg_col,text_col, str, size);
    this.id=id;
  }  
  
  String getId(){
    return id;
  }
    
}
