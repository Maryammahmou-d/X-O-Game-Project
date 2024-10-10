import 'package:flutter/material.dart';
import 'package:xo_game/Data_Model.dart';
import 'package:xo_game/xoScreen.dart';

class loginScreen extends StatelessWidget {
  static const String routeName = "Login Screen";

  String playerOneName = "";
  String playerTwoName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "X O",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.purple,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    playerOneName = value;
                  },
                  decoration: InputDecoration(
                    label: Text("Player One Name",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    playerTwoName = value;
                  },
                  decoration: InputDecoration(
                    label: Text("Player Two Name",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, xoScreen.routeName,
                            arguments:
                                loginModel(playerOneName, playerTwoName));
                      },
                      child: Text("Let's Go!")),
                )
              ],
            ),
          ),
        ));
  }
}
