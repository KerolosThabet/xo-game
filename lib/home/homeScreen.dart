import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'buildScoreWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = 'home';

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  bool oTurn = true;
  int xScore = 0;
  int oScore = 0;
  int filledBoxes = 0;
  List<String> display = List.filled(9, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: REdgeInsets.only(top: 50,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildScoreColumn("Player X", xScore),
                buildScoreColumn("Player O", oScore),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: REdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        display[index],
                        style: TextStyle(color: Colors.white, fontSize: 35.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
              onTap: () {
                _resetBoard();
                xScore = 0 ;
                oScore =0;
              },
                child: Container(
                 padding:  REdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration( color: Colors.blueGrey,borderRadius: BorderRadius.circular(10).r),
                 
                  child: Text(
                    "Restart",style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                )
            ),
          Padding(
            padding:  REdgeInsets.only(top: 80,bottom: 30),
            child: Text(
              "TIC TAC TOE",
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      if (display[index] == '') {
        display[index] = oTurn ? "O" : "X";
        filledBoxes++;
        oTurn = !oTurn;
        _checkWinner();
      }
    });
  }
  void _checkWinner() {
    List<List<int>> winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var positions in winPositions) {
      if (display[positions[0]] == display[positions[1]] &&
          display[positions[0]] == display[positions[2]] &&
          display[positions[0]] != '') {
        showWinDialog(display[positions[0]]);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }
  void _showDrawDialog() {
    _showDialog("Draw", "Play again!");
    _resetBoard();
  }
  void showWinDialog(String winner) {
    if (winner == 'O') {
      oScore++;
    } else {
      xScore++;
    }
    _showDialog("Winner is: $winner", "Play again!");
    _resetBoard();
  }
  void _showDialog(String title, String buttonText) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15).r),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.blueAccent, fontSize: 20.sp),
              ),
            ),
          ],
        );
      },
    );
  }
  void _resetBoard() {
    setState(() {
      display = List.filled(9, '');
      filledBoxes = 0;
    });
  }

}