import 'package:first_game/game_controller.dart';
import 'package:flutter/cupertino.dart';

class Enemy {
  final GameController gameController;
  int health;
  int damage;
  double speed;
  Rect enemyRect;
  bool isDead = false;

  Enemy(this.gameController, double x, double y) {
    health = 3;
    damage = 1;
    speed = gameController.tileSize * 2;
    enemyRect = Rect.fromLTWH(
      x,
      y,
      gameController.tileSize * 1.2,
      gameController.tileSize * 1.2,
    );
  }

  void render(Canvas c){
    Color color;
    switch (health){
      case 1:
      color = Color(0xFFFF7F7F);
      
    }
  }
}
