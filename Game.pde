import java.util.Arrays;

class Game {
  static final int N_playsrs = 4;
  Cards cards = new Cards(true);
  Player[] players = new Player[N_playsrs];
  
  Game() {
    for(int i=0;i<players.length;i++) {
      players[i] = new Player("플레이어"+(i+1));
    }    
  }
  
  void startGame() {
    for(int i=0; i<players.length; i++) {
      players[i].NewGame();
    }
  }
}
