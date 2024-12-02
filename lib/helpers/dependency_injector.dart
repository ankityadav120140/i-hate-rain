import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/game_controller.dart';
import '../controllers/score_controller.dart';

Future<void> initDependencies() async {
  await GetStorage.init();
  Get.put(ScoreController());
  Get.put(GameController());
}
