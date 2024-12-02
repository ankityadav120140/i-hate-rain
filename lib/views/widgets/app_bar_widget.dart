import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/score_controller.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreController = Get.find<ScoreController>();

    return AppBar(
      centerTitle: true,
      title: const Text('I Hate Rain'),
      backgroundColor: Colors.white.withOpacity(0.6),
      elevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                'Highest: ${scoreController.highestScore}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18, color: Colors.green),
              ),
            ),
            Obx(
              () => Text(
                'Score: ${scoreController.score}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
