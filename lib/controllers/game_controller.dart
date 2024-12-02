// lib/controllers/game_controller.dart

import 'package:get/get.dart';

import '../constants/game_constants.dart';

class GameController extends GetxController {
  var rainDropSpeed = GameConstants.raindropSpeed.obs;

  // Method to increase the speed
  void increaseRaindropSpeed(int score) {
    if (score % 50 == 0 && score > 0) {
      rainDropSpeed.value += 5;
    }
  }
}
