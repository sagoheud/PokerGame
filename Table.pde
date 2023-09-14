public class Table extends Rect{
  ArrayList<DrawObj>objs = new ArrayList<DrawObj>();
  
  Table(int x1, int  y1, int  x2, int  y2, color bg_col){
    super(x1, y1, x2, y2, bg_col, bg_col);
    createObj();
  }  
  
  void createObj(){
    // objs.add(  ---- );
  }
  
  void addObj(DrawObj o){
    objs.add(o);
  }
  
  void clickEvent(String id){
    
  }
  
  void onClick(int x, int y){
    for( DrawObj o : objs ){
      if( o instanceof Button ){
        Button b = (Button)o;
        if(b.isIn(x,y)){
          clickEvent(b.getId());
          break;
        }
      } 
    } 
  }
  
  
  void draw(){
    super.draw();
    for( DrawObj o : objs ){
      o.draw();
    }
  }

}
