import 'package:first_game/game_controller.dart';
import 'package:flame/flame.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class Player {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  bool isDead = false;
  Sprite boy = Sprite('boy.png');
  var position;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size/2,
      gameController.screenSize.height / 2 -size/2,
      size,
      size,
    );
    position = Position(gameController.screenSize.width / 2 - size/2,
      gameController.screenSize.height / 2 -size/2 );
  }

  void render(Canvas c){
    final size = Position(gameController.tileSize * 1.5,gameController.tileSize * 1.5);
    //Paint color = Paint()..color = Color(0xFF0000FF);
    //c.drawRect(playerRect, color );
    boy.renderPosition(c,position,size: size);
    


  }

  void update(double t){
    //print(currentHealth);
    if(!isDead && currentHealth <= 0){
      isDead = true;
      gameController.initialize();


    }

  }
}
