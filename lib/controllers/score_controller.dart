import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScoreController extends GetxController {
  var score = 0.obs;
  var highestScore = 0.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    highestScore.value = box.read('highestScore') ?? 0;
  }

  void increment() {
    score.value++;
    if (score.value > highestScore.value) {
      highestScore.value = score.value;
      box.write('highestScore', highestScore.value);
    }
  }

  void reset() {
    score.value = 0;
  }
}
