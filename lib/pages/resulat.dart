import 'dart:math';
import 'package:flutter/material.dart';

class Resulat extends StatelessWidget {
  const Resulat(
      {super.key,
      required this.isMale,
      required this.age,
      required this.height,
      required this.weight});
  final bool isMale;
  final int age, weight;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "BMI",
            style: Theme.of(context).textTheme.headline2,
          ),
          toolbarHeight: 60,
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Gender : ${isMale ? "Male" : "Female"}",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                " halthnes : ${helthy()}",
                style: Theme.of(context).textTheme.headline1,
                
              ),
              Text(
                "Age : $age",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "Height : ${height.toStringAsFixed(1)}",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 45)
              ),
            ],
          ),
        ),
      ),
    );
  }

  helthy() {
    var result = weight / pow(height / 100, 2);
    if (result > 30) {
      return "bease";
    } else if (result < 30 && result > 18) {
      return "overfit";
    } else if (result < 18 && result > 15) {
      return "Normal";
    } else {
      return "thin";
    }
  }
}
