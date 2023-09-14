public class DrawObj{
  int x1,y1;  
  int x2,y2;
  color col;
  
  public DrawObj(int x1,int y1,int x2,int y2){
    this.x1 = (x1 < x2) ? x1 : x2 ;
    this.x2 = (x2 > x1) ? x2 : x1 ;
    this.y1 = (y1 < y2) ? y1 : y2 ;
    this.y2 = (y2 > y1) ? y2 : y1 ;
  }
  public void setColor(color col){ this.col = col; }
  
  int getWidth(){ return (x2-x1); }
  int getHeight(){ return (y2-y1); }
  
  int getCenterX(){ return x1 + (getWidth()/2); }
  int getCenterY(){ return y1 + (getHeight()/2); }
  
  public boolean isIn(int x,int y){
    if ( x < x1 || x > x2) return false;     
    if ( y < y1 || y > y2 ) return false;     
    return true;
  }
  
  void draw(){
    
  }   
}
