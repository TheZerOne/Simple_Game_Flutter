
import 'dart:ui';
import 'package:first_game/components/enemy.dart';
import 'package:first_game/components/health_bar.dart';
import 'package:first_game/components/player.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';


class GameController extends Game{

  Size screenSize;
  double tileSize;

  Player player;
  Enemy enemy;

  HealthBar healthBar;

    GameController(){

      initialize();
    }

    void initialize() async {
      resize(await Flame.util.initialDimensions());
      player = Player(this);
      enemy =Enemy(this,200,200);
      healthBar = HealthBar(this);
    }


  void render(Canvas canvas) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xF0FFFAFA);
    canvas.drawRect(background, backgroundPaint);  
    player.render(canvas);
    enemy.render(canvas);
    healthBar.render(canvas);
  }


  void update(double t) {
    enemy.update(t);
    player.update(t);
    healthBar.update(t);

   
  }

  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width /10;

  }  

  void onTapDown(TapDownDetails d){
    print(d.globalPosition);
    enemy.health--;

  }
}