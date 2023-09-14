class Player {
  Cards hand = new Cards(false);  
  Cards board = new Cards(false);
  String name;
  
  Player(String name) {
    this.name = name;
  }
  
  void take(Card c) { // 카드 손으로 전달
    hand.take(c);
  }
  
  void show() { // 전달 받은 것을 보드에 표시
    hand.giveToN(board, hand.getCardNumbers());
    hand.showAll();
  }

  @Override // 표시되는걸 문자열로 나타냄
  String toString() {
    return name+"(hand:" + hand + ", board:" + board + ")";
  }
  
  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  void NewGame() { // 새 게임 시작시 모든 카드 리셋
    hand.removeAll();
    board.removeAll();
  }
  
  Cards getHandCards() {
    return hand;
  }
  
}
