import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  TicTacToeState createState() => TicTacToeState();
}

class TicTacToeState extends State<TicTacToe> {
  List<List<String>> board = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "],
  ];
  String _turn = "X";

  void changeTurn() {
    setState(() {
      _turn = _turn == "X" ? "O" : "X";
    });
  }

  String currentPlayer = "X";
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
    if (currentPlayer == "O") {
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
          currentPlayer == "X";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tic Tac Toe"),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          board[row][col] = currentPlayer;
                          currentPlayer = currentPlayer == "X" ? "O" : "X";
                          aiMove();
                          print(_turn);
                          print(currentPlayer);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color:
                            board[row][col] == "X" ? Colors.blue : Colors.red,
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
            Text("Player: $currentPlayer"),
          ],
        ),
      ),
    );
  }
}
