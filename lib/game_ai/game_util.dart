class GameUtil {
  static const Player1 = 1;
  static const Player2 = -1;

  static int togglePlayer(int currentPlayer) {
    return -1 * currentPlayer;
  }
  
  static const DRAW = 2;
  static const NO_WINNER_YET = 0;
  static const EMPTY = 0;


  static const WIN_CONDITIONS_LIST = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];


  static bool isValidMove(List<int> board, int idx) => board[idx] == EMPTY;

  static bool isBoardFull(List<int> board) {
    for (var value in board) {
      if (value == EMPTY) return false;
    }
    return true;
  }

  static int checkIfWinnerFound(List<int> board) {
    for (var winnerList in WIN_CONDITIONS_LIST) {
      if (board[winnerList[0]] != EMPTY &&
          board[winnerList[0]] == board[winnerList[1]] &&
          board[winnerList[0]] == board[winnerList[2]]) {
        return board[winnerList[0]];
      }
    }
    if (isBoardFull(board)) {
      return DRAW;
    }
    return NO_WINNER_YET;
  }
}
