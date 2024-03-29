import 'package:first_game/components/enemy.dart';
import 'package:first_game/game_controller.dart';

class EnemySpawner {
  final GameController gameController;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 700;
  final int intervalChange = 3;
  final int maxEnemies = 7;
  int currentInterval;
  int nextSpawn;
  int a;

  EnemySpawner(this.gameController) {
    initialize();
  }

  void initialize() {
    killAllenemies();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAllenemies() {
    gameController.enemies.forEach((Enemy enemy) => enemy.isDead = true);
  }

  void update(double t) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (gameController.enemies.length < maxEnemies && now >= nextSpawn) {
      gameController.spawnEnemy();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.1).toInt();
      }

      nextSpawn = now + currentInterval;
    }
  }
}
