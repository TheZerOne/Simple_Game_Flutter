import 'dart:math';
import 'dart:ui';
import 'package:first_game/components/enemy.dart';
import 'package:first_game/components/health_bar.dart';
import 'package:first_game/components/player.dart';
import 'package:first_game/components/score_text.dart';
import 'package:first_game/enemy_spawner.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends Game {
  final SharedPreferences storage;
  Size screenSize;
  Random rand;
  double tileSize;
  Player player;
  EnemySpawner enemySpawner;
  List<Enemy> enemies;
  HealthBar healthBar;
  int score;
  ScoreText scoreText;


  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    rand = Random();
    resize(await Flame.util.initialDimensions());
    player = Player(this);
    enemies = List<Enemy>();
    enemySpawner = EnemySpawner(this);
    healthBar = HealthBar(this);
    score = 0;
    scoreText = ScoreText(this);
  }

  void render(Canvas canvas) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xF0FFFAFA);
    canvas.drawRect(background, backgroundPaint);
    player.render(canvas);
    enemies.forEach((Enemy enemy) => enemy.render(canvas));
    scoreText.render(canvas);
    healthBar.render(canvas);
  }

  void update(double t) {
    //enemySpawner.update(t);
    enemies.forEach((Enemy enemy) => enemy.update(t));
    enemies.removeWhere((Enemy enemy) => enemy.isDead);
    player.update(t);
    scoreText.update(t);
    healthBar.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    print(d.globalPosition);
    enemies.forEach((Enemy enemy) {
      if (enemy.enemyRect.contains(d.globalPosition)) {
        enemy.onTapDown();
      }
    });
  }

  void spawnEnemy() {
    double x, y;
    switch (rand.nextInt(4)) {
      case 0:
        //Top
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        break;
      case 1:
        //Right
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      case 2:
        //Bottom
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 3:
        //Left
        x = -tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
}
