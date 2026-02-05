import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/game_controller.dart';

class RestartButtonWidget extends StatelessWidget {
  const RestartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (controller) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.resetGame,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.indigo.shade700, width: 2),
              ),
              elevation: 4,
            ),
            child: const Text(
              "Restart Game",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
