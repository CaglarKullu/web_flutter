import 'dart:math';

import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicTacToeAI extends ConsumerStatefulWidget {
  const TicTacToeAI({super.key});

  @override
  ConsumerState<TicTacToeAI> createState() => TicTacToeAIState();
}

class TicTacToeAIState extends ConsumerState<TicTacToeAI> {
  List<List<String>> board = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "],
  ];
  String _turn = "X";

  void resetGame() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => super.widget));
  }

  void changeTurn() {
    setState(() {
      _turn = _turn == "O" ? "X" : "O";
    });
  }

  bool checkWin(String player) {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == player &&
          board[i][1] == player &&
          board[i][2] == player) {
        return true;
      }
      if (board[0][i] == player &&
          board[1][i] == player &&
          board[2][i] == player) {
        return true;
      }
    }
    if (board[0][0] == player &&
        board[1][1] == player &&
        board[2][2] == player) {
      return true;
    }
    if (board[0][2] == player &&
        board[1][1] == player &&
        board[2][0] == player) {
      return true;
    }
    return false;
  }

  void aiMove() {
    if (_turn == "O") {
      List<List<int>> emptySquares = [];
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == " ") {
            emptySquares.add([i, j]);
          }
        }
      }
      if (emptySquares.isNotEmpty) {
        int randomIndex = Random().nextInt(emptySquares.length);
        int row = emptySquares[randomIndex][0];
        int col = emptySquares[randomIndex][1];
        setState(() {
          board[row][col] = "O";
          checkWin(_turn);
          changeTurn();
          checkWin(_turn);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = ref.watch(sizeProviderProvider(context));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
      ),
      body: checkWin(_turn)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("$_turn wins!")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: resetGame, child: const Text("Reset Game!")),
                ),
              ],
            )
          : Center(
              child: Column(
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        height: size.height,
                        width: size.width / 2.25,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            int row = index ~/ 3;
                            int col = index % 3;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (board[row][col] == " ") {
                                    board[row][col] = _turn;
                                    changeTurn();
                                    aiMove();
                                    checkWin(_turn);
                                  }
                                });
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  color: board[row][col] == "X"
                                      ? Colors.blue
                                      : Colors.red,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                duration: const Duration(seconds: 1),
                                child: Center(
                                  child: Text(
                                    board[row][col],
                                    style: const TextStyle(fontSize: 50),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Text("Player: $_turn"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: resetGame, child: const Text("Reset Game!")),
                  ),
                ],
              ),
            ),
    );
  }
}
