import 'dart:async';

import 'package:entrevista/domain/domain.dart';

class HomeController {
  final StreamController<Game> _gameStreamController =
      StreamController<Game>.broadcast();

  Stream<Game> get gameStream => _gameStreamController.stream;

  late Game game;

  HomeController() {
    game = Game.startNewGame();
  }

  void restart() {
    game = Game.startNewGame();
    start();
  }

  void start() {
    _gameStreamController.add(game);
  }

  void onCellTapped(Player player, int row, int column) {
    if (row == 0) {
      game.firstRow[column] = player.getInput();
    } else if (row == 1) {
      game.secondRow[column] = player.getInput();
    } else {
      game.thirdRow[column] = player.getInput();
    }

    if (player == Player.one) {
      game.currentPlayer = Player.two;
    } else {
      game.currentPlayer = Player.one;
    }

    _gameStreamController.add(game);
  }
}
