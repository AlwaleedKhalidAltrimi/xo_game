import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class GameDialogs {
  GameDialogs._();

  static void showWinner(String winner, VoidCallback onRestart) {
    _showActionDialog(
      title: "Congratulations",
      message: "The Winner is $winner",
      type: DialogType.success,
      color: Colors.teal,
      actionText: "Play Again",
      onAction: onRestart,
    );
  }

  static void showDraw(VoidCallback onRestart) {
    _showActionDialog(
      title: "Game Over",
      message: "Game finished without Winner!",
      type: DialogType.info,
      color: Colors.amber,
      actionText: "Play Again",
      onAction: onRestart,
    );
  }

  static void showInvalidMove() {
    _showInfoDialog(
      title: "Invalid Move",
      message: "This position is already taken! Please choose another box.",
      type: DialogType.warning,
      color: Colors.orangeAccent,
    );
  }

  /// Dialog with ONE primary action (best UX)
  static void _showActionDialog({
    required String title,
    required String message,
    required DialogType type,
    required Color color,
    required String actionText,
    required VoidCallback onAction,
  }) {
    final context = Get.context;
    if (context == null) return;

    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.bottomSlide,
      title: title,
      desc: message,
      titleTextStyle: _titleStyle(color),
      descTextStyle: _descStyle,
      btnOkText: actionText,
      btnOkOnPress: onAction,
    ).show();
  }

  /// Informational dialog (just close)
  static void _showInfoDialog({
    required String title,
    required String message,
    required DialogType type,
    required Color color,
  }) {
    final context = Get.context;
    if (context == null) return;

    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.bottomSlide,
      title: title,
      desc: message,
      titleTextStyle: _titleStyle(color),
      descTextStyle: _descStyle,
      btnOkText: "OK",
    ).show();
  }

  static TextStyle _titleStyle(Color color) =>
      TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20);

  static const TextStyle _descStyle = TextStyle(fontSize: 16, height: 1.5);
}
