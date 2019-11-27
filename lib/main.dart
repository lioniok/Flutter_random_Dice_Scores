import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      title: "SixDicee",
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('FlatButton: Random Dices'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //initially
  int leftDice = 1;
  int midDice = 1;
  int rightDice = 1;

  int leftFlex = 1;
  int midFlex = 1;
  int rightFlex = 1;

  void randomDiceGenerate() {
    leftDice = Random().nextInt(6) + 1;
    midDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //FlatButton has default Padding EdgeInsets.all(16)
            child: FlatButton(
              child: Image.asset("images/dice$leftDice.png"),
              onPressed: () {
                setState(() {
                  randomDiceGenerate();
                  leftFlex = 2;
                  midFlex = 1;
                  rightFlex = 1;
                });
              },
            ),
            flex: leftFlex,
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset("images/dice$midDice.png"),
              onPressed: () {
                setState(() {
                  randomDiceGenerate();
                  leftFlex = 1;
                  midFlex = 2;
                  rightFlex = 1;
                });
              },
            ),
            flex: midFlex,
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset("images/dice$rightDice.png"),
              onPressed: () {
                setState(() {
                  randomDiceGenerate();
                  leftFlex = 1;
                  midFlex = 1;
                  rightFlex = 2;
                });
              },
            ),
            flex: rightFlex,
          ),
        ],
      ),
    );
  }
}
