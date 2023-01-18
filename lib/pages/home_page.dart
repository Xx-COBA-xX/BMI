// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_string_interpolations

import 'package:bmi/pages/resulat.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int age = 18, weight = 40;
  double height = 90;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: Text("BMI", style: Theme.of(context).textTheme.headline2),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    m1Expanded(context, "male"),
                    SizedBox(
                      width: 20,
                    ),
                    m1Expanded(context, "female"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Heigth",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${height.toStringAsFixed(1)} ",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "CM",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 25),
                          ),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: height,
                        onChanged: (value) => setState(() {
                          height = value;
                        }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    m2Expanded(context, "Weight"),
                    SizedBox(
                      width: 20,
                    ),
                    m2Expanded(context, "Age"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 16,
                width: double.infinity,
                color: Colors.teal,
                child: TextButton(
                  child: Text(
                    "Calculate",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 27),
                  ),
                  onPressed: () {
                    showToast(
                      'Your Result is :',
                      context: context,
                      backgroundColor: Colors.teal.shade300,
                      textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      animation: StyledToastAnimation.scale,
                      reverseAnimation: StyledToastAnimation.fade,
                      position: StyledToastPosition(align:Alignment.topCenter, offset: 90.0 ),
                      animDuration: Duration(seconds: 1),
                      duration: Duration(seconds: 4),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.linear,
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Resulat(
                          isMale: isMale,
                          age: age,
                          height: height,
                          weight: weight,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          isMale = (type == "male") ? true : false;
        }),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: (isMale && type == "male") ||
                    (isMale == false && type == "female")
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 90,
              ),
              Text(
                type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String title) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$title",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "${title == "Age" ? age : weight}",
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: title == "Age" ? 'Age++' : "weight++",
                  mini: true,
                  onPressed: () {
                    setState(() {
                      title == "Age" ? age++ : weight++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: title == "Age" ? 'Age--' : "weight--",
                  mini: true,
                  onPressed: () {
                    setState(() {
                      title == "Age" ? age-- : weight--;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    size: 25,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
