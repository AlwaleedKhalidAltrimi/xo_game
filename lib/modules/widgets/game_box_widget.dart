import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/game_controller.dart';
import '../widgets/game_dialogs.dart';

class GameBoxWidget extends StatelessWidget {
  final int index;
  final GameController controller;

  const GameBoxWidget({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => _handleBoxTap(),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: _getBoxColor(),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withValues(alpha: 0.3),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: _getSymbolColor(),
            ),
            child: Text(controller.boxesData[index]),
          ),
        ),
      ),
    );
  }

  void _handleBoxTap() {
    final result = controller.handleBoxClick(index);

    switch (result) {
      case GameResult.win:
        GameDialogs.showWinner(controller.winner.value, controller.resetGame);
        break;
      case GameResult.draw:
        GameDialogs.showDraw(controller.resetGame);
        break;
      case GameResult.invalidMove:
        GameDialogs.showInvalidMove();
        break;
      case GameResult.continueGame:
        // Continue playing
        break;
    }
  }

  Color _getBoxColor() {
    final boxValue = controller.boxesData[index];
    if (boxValue == controller.player1) {
      return Colors.teal.withValues(alpha: 0.9);
    } else if (boxValue == controller.player2) {
      return Colors.amber.withValues(alpha: 0.9);
    } else {
      return Colors.grey.shade300;
    }
  }

  Color _getSymbolColor() {
    final boxValue = controller.boxesData[index];
    if (boxValue == controller.player1) {
      return Colors.white;
    } else if (boxValue == controller.player2) {
      return Colors.white;
    } else {
      return Colors.transparent;
    }
  }
}
