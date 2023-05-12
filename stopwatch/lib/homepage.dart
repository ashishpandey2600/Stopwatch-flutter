import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stopwatch? stopwatch;
  Timer? t;
  void handleStartStop() {
    if (stopwatch!.isRunning) {
      stopwatch!.stop();
    } else {
      stopwatch!.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch!.elapsed.inMicroseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CupertinoButton(
            onPressed: () {
              handleStartStop();
            },
            padding: EdgeInsets.all(0),
            child: Container(
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xff0395eb),
                    width: 4,
                  )),
              child: Text(
                returnFormattedText(),
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
              child: Text(
                "Reset",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                stopwatch!.reset();
              })
        ]),
      )),
    );
  }
}
