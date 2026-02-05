import 'package:flutter/material.dart';
import '../widgets/player_info_widget.dart';
import '../widgets/game_board_widget.dart';
import '../widgets/restart_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "XO Game",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.5),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          children: [
            PlayerInfoWidget(),
            SizedBox(height: 20),
            Expanded(child: Center(child: GameBoardWidget())),
            SizedBox(height: 20),
            RestartButtonWidget(),
          ],
        ),
      ),
    );
  }
}
