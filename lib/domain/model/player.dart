import 'package:entrevista/domain/domain.dart';

enum Player {
  one,
  two;

  InputType getInput() {
    switch (this) {
      case Player.one:
        return InputType.circles;
      case Player.two:
        return InputType.crosses;
    }
  }
}
