class MainTable extends Table {
  Button btnRefund;
  Text tRefund1; Text tRefund2; Text tRefund3; Text tRefund4;

  MainTable() {
    super(0, 0, width, height, color(255)); // Screen
  }

  //중심 360,360
  void createObj() {
    addObj(new Rect(0, 0, 720, 720, color(20, 255, 200), color(20, 255, 200)));
    addObj(new Rect(100, 100, 620, 620, color(100, 200, 100), color(20, 255, 200)));
    addObj(btnRefund = new Button(330, 320, 390, 400, color(120, 120, 120), color(0, 0, 0), "덱", 30, "덱"));
    addObj(new Text(340, 570, 380, 590, 0, "플레이어1", 25));
    addObj(new Text(520, 350, 560, 370, 0, "플레이어2", 25));
    addObj(new Text(340, 130, 380, 150, 0, "플레이어3", 25));
    addObj(new Text(160, 350, 200, 370, 0, "플레이어4", 25));
    addObj(tRefund1 = new Text(340, 540, 380, 560, color(0, 0, 255), "", 25));
    addObj(tRefund2 = new Text(520, 380, 560, 400, color(0, 0, 255), "", 25));
    addObj(tRefund3 = new Text(340, 160, 380, 180, color(0, 0, 255), "", 25));
    addObj(tRefund4 = new Text(160, 380, 200, 400, color(0, 0, 255), "", 25));
  }

  void clickEvent(String id) {
    println(id);
    switch(id) {
    case "덱":
      Player[] players = new Player[4];
      for (int i=0; i<players.length; i++) {
        players[i] = new Player("플레이어"+(i+1));
      }
      Game g = new Game();
      g.startGame();

      Cards ca = new Cards(true);
      //System.out.println(ca); // 만들어진 모든 카드를 보여준다.
      ca.shuffle();

      for (int j=0; j<5; j++) { // 5장 카드 나눠줌
        Card c1 = ca.give(0);
        Card c2 = ca.give(0);
        Card c3 = ca.give(0);
        Card c4 = ca.give(0); // 나눠주는 카드 오류 방지를 위해 4개의 변수로 따루 만듬
        
        players[0].take(c1);
        addObj(new Label(30+60*(j+1)+60*(j), 630, 30+60*(j+1)+60*(j+1), 710, color(255, 255, 255), col, c1.toString(), 20));
        System.out.println(players[0]);
        players[1].take(c2);
        addObj(new Label(630, 30+60*(j+1)+60*(j), 710, 30+60*(j+1)+60*(j+1), color(255, 255, 255), col, c2.toString(), 20));
        System.out.println(players[1]);
        players[2].take(c3);
        addObj(new Label(30+60*(j+1)+60*(j), 90, 30+60*(j+1)+60*(j+1), 10, color(255, 255, 255), col, c3.toString(), 20));
        System.out.println(players[2]);
        players[3].take(c4);
        addObj(new Label(10, 30+60*(j+1)+60*(j), 90, 30+60*(j+1)+60*(j+1), color(255, 255, 255), col, c4.toString(), 20));
        System.out.println(players[3]);
      }
      System.out.print("남은 카드: ");
      ca.print(); // 나눠주고 남은 카드가 표기된다.
      
      // 이제 카드 패의 판별을 계산한다
      String[] s= new String[4]; 
      for (int n=0; n<players.length; n++) {
        Cards p_hand = players[n].getHandCards();
        int[] nums = p_hand.getNumbers(); // 숫자 정보 얻어온다.
        String[] strs =  p_hand.getSymbol(); // 기호 정보 얻어온다.
        Arrays.sort(nums);

        int[] count = new int[14];
        int[] count2 = new int[6];

        for (int num : nums) {
          System.out.print(num + " "); // 정보 얻어온 숫자가 오름차순으로 출력되어 나옴
          count[num]++;
        }
        for (String str : strs) { // 기호 갯수 카운트 된다.
          switch (str) {
          case "♠":
            count2[Symbol.Spade.ordinal()]++;
            break;
          case "◈":
            count2[Symbol.Diamond.ordinal()]++;
            break;
          case "♥":
            count2[Symbol.Heart.ordinal()]++;
            break;
          case "♣":
            count2[Symbol.Clover.ordinal()]++;
            break;
          case "☆":
            count2[Symbol.Joker.ordinal()]++;
            break;
          case "★":
            count2[Symbol.Joker2.ordinal()]++;
            break;
          default:
            break;
          }
          System.out.print(str + " "); // 정보 얻어온 기호가 출력되어 나옴
        }
        System.out.println();
      
      // 이제 만들어진 패에 따라 패의 이름 출력
      Loop1 :
        for (int i=0; i<count.length; i++) {
          for (int j =0; j<count.length; j++) {
            if (i!=j && count[i]==2 && count[j]==2) {
              s[n] = j+"&"+i+" Two pair";
              break Loop1;
            } else if ((count[i]==3&&count[j]==2)||(count[i]==2&&count[j]==3)) {
              if (i>j) {
                s[n] = i+" Full House";
                break Loop1;
              }
              if (i<j) {
                s[n] = j+" Full House";
                break Loop1;
              }
            }
          }

          if (count[1]==1&&count[10]==1&&count[11]==1&&count[12]==1&&count[13]==1) {
            for (int j=1; j<count2.length; j++) {
              if (count2[j]==5) {
                s[n] = "Royal Straight Flush";
                break Loop1;
              }
            }
          }

          if (i<=9) {
            if (count[i]==1&&count[i+1]==1&&count[i+2]==1&&count[i+3]==1&&count[i+4]==1) {
              for (int j=1; j<count2.length; j++) {
                if (count2[j]==5) {
                  s[n] = (i+4)+" Straight Flush";
                  break Loop1;
                }
              }
              s[n] = (i+4)+" Straight";
              break Loop1;
            }
          }

          for (int j=1; j<count2.length; j++) {
            if (count[j]==5) {
              int highestCard = nums[nums.length - 1];
              s[n] = highestCard + " Flush";
              break Loop1;
            }
          }

          if (count[i] == 4) {
            s[n] = i+" Four card";
            break Loop1;
          } else if (count[i] == 3) {
            s[n] = i+" Triple";
            break Loop1;
          } else if (count[i] == 2) {
            s[n] = i+" One pair";
            break Loop1;
          } else {
            int highestCard = nums[nums.length - 1];
            s[n] = highestCard + " High";
          }
        }
      }
      tRefund1.setString(s[0]); // 각 플레이어에 따라 게임 돌릴 때 마다 패 결과 표시
      tRefund2.setString(s[1]);
      tRefund3.setString(s[2]);
      tRefund4.setString(s[3]);
      break;
    }
  }

  void draw() {
    super.draw();
  }
}
