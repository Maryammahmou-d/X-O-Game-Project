import 'package:flutter/material.dart';
import 'package:xo_game/Data_Model.dart';
import 'Button_Widget.dart';

class xoScreen extends StatefulWidget {
  static const String routeName = "Game Screen";

  @override
  State<xoScreen> createState() => _xoScreenState();
}

class _xoScreenState extends State<xoScreen> {
  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int player1Sc = 0;

  int player2Sc = 0;

  @override
  Widget build(BuildContext context) {
    loginModel arguments =
        ModalRoute.of(context)?.settings.arguments as loginModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "X O",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.purple,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        arguments.playerOneName,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '$player1Sc',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        arguments.playerTwoName,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '$player2Sc',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonWidget(board[0], 0, onButtonClicked),
                buttonWidget(board[1], 1, onButtonClicked),
                buttonWidget(board[2], 2, onButtonClicked),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonWidget(board[3], 3, onButtonClicked),
                buttonWidget(board[4], 4, onButtonClicked),
                buttonWidget(board[5], 5, onButtonClicked),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonWidget(board[6], 6, onButtonClicked),
                buttonWidget(board[7], 7, onButtonClicked),
                buttonWidget(board[8], 8, onButtonClicked),
              ],
            )),
          ],
        ),
      ),
    );
  }

  int counter = 0;

  void onButtonClicked(index) {
    if (board[index].isNotEmpty) {
      return;
    } else {
      if (counter % 2 == 0) {
        board[index] = "X";
        counter++;
        var winer = checkWiner("X");
        if (winer) {
          initBord();
          player1Sc += 10;
          counter = 0;
        }
      } else {
        board[index] = "O";
        counter++;
        var winer = checkWiner("O");
        if (winer) {
          initBord();
          player2Sc += 10;
          counter = 0;
        }
      }
    }
    if (counter == 9) {
      initBord();
      counter = 0;
    }
    setState(() {});
  }

  bool checkWiner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      //Row
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      //Column
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBord() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
  }
}
