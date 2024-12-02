// lib/widgets/start_game_dialog.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartGameDialog extends StatelessWidget {
  const StartGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Ready!',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Get ready to protect the bird from falling raindrops!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Icon(Icons.play_arrow, size: 60, color: Colors.blue),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog and start the game
          },
          child: const Text('Play', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
