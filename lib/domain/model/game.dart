import 'package:entrevista/domain/domain.dart';

class Game {
  Game({
    required this.currentPlayer,
    required this.firstRow,
    required this.secondRow,
    required this.thirdRow,
    required this.board,
  });

  static Game startNewGame() => Game(
        currentPlayer: Player.one,
        board: {
          0: {0: InputType.white, 1: InputType.white, 2: InputType.white},
          1: {0: InputType.white, 1: InputType.white, 2: InputType.white},
          2: {0: InputType.white, 1: InputType.white, 2: InputType.white},
        },
        firstRow: <InputType>[
          InputType.white,
          InputType.white,
          InputType.white
        ],
        secondRow: <InputType>[
          InputType.white,
          InputType.white,
          InputType.white
        ],
        thirdRow: <InputType>[
          InputType.white,
          InputType.white,
          InputType.white
        ],
      );

  Player currentPlayer;

  final List<InputType> firstRow;
  final List<InputType> secondRow;
  final List<InputType> thirdRow;

  final Map<int, Map<int, InputType>> board;
}
