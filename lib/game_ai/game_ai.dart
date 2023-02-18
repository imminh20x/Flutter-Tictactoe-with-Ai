import 'game_util.dart';

class GameAI {
  static const WIN_SCORE = 10;
  static const LOSE_SCORE = -10;
  static const DRAW_SCORE = 0;

  int play(List<int> board, int currentPlayer) {
    return _getAIMove(board, currentPlayer).move;
  }

  //hàm minimax với người chơi hiện tại là AI và trạng thái của bàn cờ hiện tại làm tham số
  Move _getAIMove(List<int> board, int currentPlayer) {
    //List các ô cờ
    List<int> _newBoard;
    //lưu đường đi tốt nhất hiện tại với giá trị là âm vô cực
    Move _bestMove = Move(score: -10000, move: -1);
    //Duyệt qua tất cả các ô cờ
    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      //Kiểm tra xem ô cờ có còn trống không
      if (!GameUtil.isValidMove(board, currentMove)) continue;
      //Cập nhật trạng thái các ô cờ trong bàn cờ và cập nhật lại score cho ô
      _newBoard = List.from(board);
      _newBoard[currentMove] = currentPlayer;
      int _newScore = -_getBestScore(
        _newBoard,
        GameUtil.togglePlayer(currentPlayer),
      );
      //Tìm và lấy ra ô cờ tốt nhất để đánh
      if (_newScore > _bestMove.score) {
        _bestMove.score = _newScore;
        _bestMove.move = currentMove;
      }
    }
    //Trả về ô tốt nhất để đánh
    return _bestMove;
  }

  int _getBestScore(List<int> board, int currentPlayer) {
    final _winner = GameUtil.checkIfWinnerFound(board);
    if (_winner == currentPlayer) {
      return WIN_SCORE;
    } else if (_winner == GameUtil.togglePlayer(currentPlayer)) {
      return LOSE_SCORE;
    } else if (_winner == GameUtil.DRAW) {
      return DRAW_SCORE;
    }
    return _getAIMove(board, currentPlayer).score;
  }
}

class Move {
  int score;
  int move;

  Move({
    required this.score,
    required this.move,
  });
}
