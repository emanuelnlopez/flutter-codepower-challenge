import 'package:entrevista/domain/domain.dart';
import 'package:entrevista/presentation/presentation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tic-tac-toe')),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
          child: StreamBuilder<Game>(
        stream: _controller.gameStream,
        builder: (context, snapshot) {
          late Widget result;
          if (!snapshot.hasData) {
            result = const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            result = _GameBoard(
              game: snapshot.data!,
              controller: _controller,
            );
          }

          return result;
        },
      )),
    );
  }
}

class _GameBoard extends StatelessWidget {
  const _GameBoard({
    required this.game,
    required this.controller,
  });

  final Game game;
  final HomeController controller;

  Color _getColor(InputType type) {
    late Color color;
    switch (type) {
      case InputType.white:
        color = Colors.white;
        break;
      case InputType.crosses:
        color = Colors.red;
        break;
      case InputType.circles:
        color = Colors.blue;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('It is ${game.currentPlayer} turn'),
        ElevatedButton(
          onPressed: controller.restart,
          child: Text('Restart game'),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 0, 0),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.firstRow.first)),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 0, 1),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.firstRow[1])),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 0, 2),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.firstRow[2])),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 1, 0),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.secondRow.first)),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 1, 1),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.secondRow[1])),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 1, 2),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.secondRow[2])),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 2, 0),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.thirdRow.first)),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 2, 1),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.thirdRow[1])),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onCellTapped(game.currentPlayer, 2, 2),
              child: SizedBox(
                height: 40,
                width: 40.0,
                child: ColoredBox(color: _getColor(game.thirdRow[2])),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
