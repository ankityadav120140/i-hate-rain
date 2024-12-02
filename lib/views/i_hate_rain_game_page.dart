// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:get/get.dart';
import '../controllers/score_controller.dart';
import '../game/i_hate_rain_game.dart';
import 'widgets/app_bar_widget.dart';

class IHateRainGamePage extends StatefulWidget {
  const IHateRainGamePage({super.key});

  @override
  _IHateRainGamePageState createState() => _IHateRainGamePageState();
}

class _IHateRainGamePageState extends State<IHateRainGamePage> {
  late IHateRainGame game;
  final ScoreController scoreController = Get.put(ScoreController());

  @override
  void initState() {
    super.initState();
    game = IHateRainGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: GameWidget(game: game),
    );
  }
}
