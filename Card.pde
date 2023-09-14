import java.util.ArrayList;

// 생성자 부분  
static class Card {
  int number;
  Symbol symbol;
  Color col;
  String cardName;
  boolean show;
  static final int JOKER = 0;

  String[] num2String = {
      "JOKER","A","2","3","4","5","6",
      "7","8","9","10","J","Q","K"};
  String[] num2StringJ = {
      "z","Z"};
  
  // 일반 숫자용
  Card(int number,Symbol symbol) {
    this.number = number;
    this.symbol = symbol;
    this.col = (symbol == Symbol.Spade || symbol == Symbol.Clover)
        ? Color.Black : Color.Colored;
    cardName = symbol.str()+ num2String[number] ;
    hide();
  }
  
  // Joker용
  Card(Symbol symbol,Color col) {
    this.symbol = symbol;
    this.col = col;
    cardName = this.symbol.str();
    hide();
  }
  
  @Override
  String toString() {
    //if(!show) return "[]"; // 뒤집어진 모습
    return cardName;
  }
  
  static ArrayList<Card> makeDeck() {
    ArrayList<Card> deck = new ArrayList<Card>();
    Symbol[] symbols = {Symbol.Spade, Symbol.Heart, Symbol.Diamond, Symbol.Clover};
    for(int n=1;n<=13;n++) { // 숫자 만큼 카드 생성
      for(int s=0;s<4;s++) { // 기호 만큼 카드 생성
        Card c = new Card(n,symbols[s]);
        //System.out.print(c.cardName+"\t");
        deck.add(c);
      }
    }
    deck.add(new Card(Symbol.Joker,Color.Black));
    deck.add(new Card(Symbol.Joker2,Color.Colored)); // 조커2개
    
    return deck;
  }
  
  void show() {this.show=true;}
  void hide() {this.show=false;}
  
}

enum Symbol {
  Spade("♠"), Diamond("◈"), Heart("♥"), Clover("♣"),Joker("☆"),Joker2("★"); 
  
  private final String str;
  Symbol(String str){this.str = str;}
  String str() {return this.str;}
};
enum Color{Black , Colored}; 
// enum 열거자: 정수나 문자열들을 표현하는 방법
