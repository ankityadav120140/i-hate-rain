import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:flame/events.dart';
import '../constants/game_constants.dart';
import '../controllers/game_controller.dart';
import '../controllers/score_controller.dart';

class IHateRainGame extends FlameGame {
  late SpriteComponent background1;
  late SpriteComponent background2;
  late Bird bird;
  late SpriteComponent cloud;
  late List<Raindrop> raindrops;

  Random rand = Random();

  final ScoreController scoreController = Get.find();
  final GameController gameController = Get.find();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await loadGameAssets();

    raindrops = [];
    await _showStartGameDialog();
  }

  loadGameAssets() async {
    background1 = SpriteComponent()
      ..sprite = await loadSprite('background.jpg')
      ..size = size
      ..position = Vector2(0, 0);
    add(background1);

    background2 = SpriteComponent()
      ..sprite = await loadSprite('background.jpg')
      ..size = size
      ..position = Vector2(0, -size.y);
    add(background2);

    bird = Bird()
      ..sprite = await loadSprite('bird.png')
      ..size = Vector2(30, 30)
      ..position = Vector2(size.x / 2 - 25, size.y / 1.3);
    add(bird);

    cloud = SpriteComponent()
      ..sprite = await loadSprite('cloud.png')
      ..size = Vector2(size.x, 150)
      ..position = Vector2(0, 0);
    add(cloud);
  }

  Future _showStartGameDialog() async {
    await Get.dialog(
      AlertDialog(
        title: const Text('Start Game'),
        content:
            const Text('Get ready to protect the bird from falling raindrops!'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow, size: 30),
                onPressed: () {
                  scoreController.reset();
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    gameController.increaseRaindropSpeed(scoreController.score.value);

    background1.position.y += GameConstants.backgroundSpeed * dt;
    background2.position.y += GameConstants.backgroundSpeed * dt;

    if (background1.position.y >= size.y) {
      background1.position.y = background2.position.y - size.y;
    }
    if (background2.position.y >= size.y) {
      background2.position.y = background1.position.y - size.y;
    }

    List<Raindrop> raindropsToRemove = [];

    for (var raindrop in raindrops) {
      raindrop.position.y += gameController.rainDropSpeed.value * dt;

      if (bird.toRect().overlaps(raindrop.toRect())) {
        stopGame();
        return;
      }

      if (raindrop.position.y > size.y) {
        raindropsToRemove.add(raindrop);
        scoreController.increment();
      }
    }

    for (var raindrop in raindropsToRemove) {
      removeRaindrop(raindrop);
    }

    if (rand.nextDouble() < GameConstants.raindropSpawnRate) {
      generateRaindrop();
    }
  }

  void removeRaindrop(Raindrop raindrop) {
    raindrops.remove(raindrop);
    remove(raindrop);
  }

  Future<void> generateRaindrop() async {
    if (raindrops.length >= GameConstants.maxRaindrops) return;

    final randomX = rand.nextDouble() * size.x;
    final raindrop = Raindrop()
      ..sprite = await loadSprite('raindrop.png')
      ..size = Vector2(10, 10)
      ..position = Vector2(randomX, 20);

    add(raindrop);
    raindrops.add(raindrop);
  }

  Future<void> stopGame() async {
    pauseEngine();
    await _showGameOverDialog();
    for (var raindrop in raindrops) {
      remove(raindrop);
    }
    raindrops.clear();
  }

  Future _showGameOverDialog() async {
    await Get.dialog(
      AlertDialog(
        title: const Text('Game Over'),
        content: Text('Your Score: ${scoreController.score.value}'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.refresh, size: 30),
                onPressed: () {
                  scoreController.reset();
                  Get.back();
                  restartGame();
                },
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future<void> restartGame() async {
    gameController.rainDropSpeed.value = GameConstants.raindropSpeed;
    scoreController.reset();
    raindrops.clear();
    removeAll(children);

    await loadGameAssets();
    resumeEngine();
  }
}

class Raindrop extends SpriteComponent {}

class Bird extends SpriteComponent with DragCallbacks {
  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.deviceDelta.x;

    if (position.x < 0) position.x = 0;
    if (position.x > (parent as FlameGame).size.x - size.x) {
      position.x = (parent as FlameGame).size.x - size.x;
    }
  }
}
