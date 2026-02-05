import 'package:get/get.dart';

/// Game result states for handling different game outcomes
enum GameResult { win, draw, continueGame, invalidMove }

class GameController extends GetxController {
  // Game constants
  static const String _player1Symbol = "X";
  static const String _player2Symbol = "O";
  static const int _boardSize = 9;

  // Game state observables
  final RxString currentPlayer = _player1Symbol.obs;
  final RxString winner = "".obs;
  final RxInt filledBoxesNumber = 0.obs;
  final RxList<String> boxesData = <String>[].obs;

  // Winning combinations - all possible ways to win
  static final List<List<int>> _winningCombinations = [
    // Rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // Columns
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // Diagonals
    [0, 4, 8],
    [2, 4, 6],
  ];

  /// Player symbols getter
  String get player1 => _player1Symbol;
  String get player2 => _player2Symbol;

  /// Check if game has a winner
  bool get hasWinner => winner.value.isNotEmpty;

  /// Check if game is over (win or draw)
  bool get isGameOver => hasWinner || filledBoxesNumber.value == _boardSize;

  @override
  void onInit() {
    super.onInit();
    _initializeGame();
  }

  /// Initialize or reset the game state
  void resetGame() {
    _initializeGame();
  }

  /// Handle box click logic
  /// Returns GameResult indicating the outcome of the move
  GameResult handleBoxClick(int index) {
    // Validate move
    if (!_isValidMove(index)) {
      return GameResult.invalidMove;
    }

    // Process the move
    _makeMove(index);

    // Check game state after move
    return _evaluateGameState();
  }

  /// Process a valid move
  void _makeMove(int index) {
    boxesData[index] = currentPlayer.value;
    filledBoxesNumber.value++;
  }

  /// Evaluate current game state and return appropriate result
  GameResult _evaluateGameState() {
    if (_hasCurrentPlayerWon()) {
      winner.value = currentPlayer.value;
      return GameResult.win;
    }

    if (filledBoxesNumber.value == _boardSize) {
      return GameResult.draw;
    }

    _switchPlayer();
    return GameResult.continueGame;
  }

  /// Initialize game state
  void _initializeGame() {
    winner.value = "";
    filledBoxesNumber.value = 0;
    currentPlayer.value = _player1Symbol;
    boxesData.assignAll(List.generate(_boardSize, (_) => ""));
  }

  /// Validate if a move is legal
  bool _isValidMove(int index) {
    return index >= 0 && index < _boardSize && boxesData[index].isEmpty;
  }

  /// Check if current player has won
  bool _hasCurrentPlayerWon() {
    return _winningCombinations.any(
      (combination) =>
          combination.every((index) => boxesData[index] == currentPlayer.value),
    );
  }

  /// Switch to the next player
  void _switchPlayer() {
    currentPlayer.value = currentPlayer.value == _player1Symbol
        ? _player2Symbol
        : _player1Symbol;
  }
}
