import 'package:flutter/material.dart';


Column buildScoreColumn(String player, int score) {
  return Column(
    children: [
      Text(
        player,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      SizedBox(height: 10),
      Text(
        "$score",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    ],
  );
}