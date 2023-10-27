import 'package:countdown_timer/screens/home_screen.dart';
import 'package:countdown_timer/widgets/button_Cont.dart';
import 'package:countdown_timer/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountdownTimer> {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 60);
  bool isRunning = false;
  int numOfTimesSent = 0;
  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    isRunning = true;
    numOfTimesSent++;
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    resetTimer();
  }

  void resetTimer() {
    setState(() => myDuration = Duration(seconds: 60));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        isRunning = false;
        numOfTimesSent++;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 65, 65),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 400,
              height: 620,
              child: Stack(
                children: [
                  Positioned(
                    left: 100,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6),
                          BlendMode.darken,
                        ),
                        child: Image.asset('images/profile.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 25,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 159, 159, 160)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) => HomePage()));
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 200, 199, 199)),
                                  child: Center(
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 55),
                          Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                          Container(
                            height: 35,
                            width: 210,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 114, 114, 114)),
                            child: Center(child: Text("Enter Code")),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 170,
                            height: 35,
                            child: ElevatedButton(
                              onPressed: startTimer,
                              child: isRunning
                                  ? TextWidget(text: 'Resends in $seconds')
                                  : numOfTimesSent > 1
                                      ? TextWidget(text: "Resend")
                                      : TextWidget(text: "Send Code"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 201, 202,
                                        202)), // Background color
                                foregroundColor: MaterialStateProperty.all(
                                    Colors.black), // Text color (black)
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(height: 45),
                          Text(
                            "Note: Code will expire when time runs out",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
