import java.util.ArrayList;
import java.util.Collections;

class Cards {
  ArrayList<Card> cards;

  Cards(boolean generate_card) {
    if (generate_card) {
      this.cards = Card.makeDeck();  // 한덱의 카드
    } else {
      this.cards  = new ArrayList<Card>(); // 손에 카드 없음
    }
  }

  void shuffle() {
    Collections.shuffle(cards); // 카드 섞기
  }

  void print() { // 나눠주고 남은 카드 표시된다.
    for (Card card : this.cards) {
      System.out.print(card.toString()+" ");
    }
    System.out.println();
  }

  void take(Card card) { // 카드 덱에서 카드받기
    cards.add(card);
  }

  Card give(int index) { // 카드 덱에서 카드주기
    Card c = cards.get(index);
    cards.remove(index);
    return c;
  }
  void giveTo(Cards target, int index) {
    // 카드 덱에서 n번째 카드주기
    target.take(this.give(index));
  }
  void giveTo(Cards target) {
    // 카드 덱에서 첫번째 카드주기
    giveTo(target, 0);
  }

  void giveToN(Cards target, int n_cards) {
    // 카드 덱에서 카드 n장 주기
    for (int i=0; i<n_cards; i++) {
      giveTo(target);
    }
  }

  int getCardNumbers() {
    return cards.size();
  }
  // 가진 카드 수 알려줌

  void showAll() { // 카드 오픈
    for (Card c : cards) {
      c.show();
    }
  }

  @Override // 카드 한장 출력
    public String toString() {
    String s ="";
    for (Card c : cards) {
      s += c.toString() + " ";
    }

    return "[" + s + "]";
  }

  void removeAll() {
    cards.clear();
  }

  // 카드를 줌(정보만)
  Card get(int index) {
    return cards.get(index);
  }

  int[] getNumbers() { // 가진 카드의 숫자만 모음
    int sz = cards.size();
    int[] arr = new int[sz];
    for (int i=0; i<arr.length; i++) {
      arr[i] = cards.get(i).number;
    }
    return arr;
  }

  String[] getSymbol() { // 가진 카드의 기호만 모음
    int sz = cards.size();
    String[] arr = new String[sz];
    for (int i=0; i<arr.length; i++) {
      arr[i] = cards.get(i).symbol.str();
    }
    return arr;
  }
}
