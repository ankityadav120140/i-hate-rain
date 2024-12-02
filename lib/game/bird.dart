import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

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
