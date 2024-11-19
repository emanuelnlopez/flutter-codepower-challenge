import 'package:entrevista/domain/domain.dart';

abstract class GameRepository {
  Future<Game> newGame();
}
