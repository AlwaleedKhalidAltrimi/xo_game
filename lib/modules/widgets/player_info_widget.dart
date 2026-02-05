import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/game_controller.dart';
import 'player_label_widget.dart';

class PlayerInfoWidget extends StatelessWidget {
  const PlayerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PlayerLabelWidget(
              text: "Current Player",
              fontSize: 17.5,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            const SizedBox(width: 15),
            Obx(
              () => PlayerLabelWidget(
                text: controller.currentPlayer.value,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: _getPlayerColor(controller.currentPlayer.value),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getPlayerColor(String player) {
    return player == "X" ? Colors.teal : Colors.amber;
  }
}
