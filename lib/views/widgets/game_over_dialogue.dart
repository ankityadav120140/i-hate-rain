import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/score_controller.dart';

class GameOverDialog {
  static Future<void> show(BuildContext context, Function restartGame) async {
    final scoreController = Get.find<ScoreController>();

    await Get.dialog(
      AlertDialog(
        title: const Text('Game Over'),
        content: Text('Your Score: ${scoreController.score.value}'),
        actions: [
          TextButton(
            onPressed: () {
              scoreController.reset();
              Get.back();
              restartGame();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
