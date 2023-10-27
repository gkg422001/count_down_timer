import 'package:countdown_timer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// class CountdownTimer extends StatefulWidget {
//   const CountdownTimer({super.key});

//   @override
//   State<CountdownTimer> createState() => HomePageState();
// }

// class HomePageState extends State<CountdownTimer> {
//   Timer? countdownTimer;
//   Duration myDuration = Duration(seconds: 60);
//   bool isRunning = false;
//   int numOfTimesSent = 0;
//   @override
//   void initState() {
//     super.initState();
//   }

//   /// Timer related methods ///
//   // Step 3
//   void startTimer() {
//     resetTimer();
//     isRunning = true;
//     numOfTimesSent++;
//     countdownTimer =
//         Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
//   }

//   // // Step 4
//   // void stopTimer() {
//   //   if (countdownTimer != null && countdownTimer!.isActive) {
//   //     setState(() => countdownTimer!.cancel());
//   //   }
//   // }

//   // Step 5
//   void resetTimer() {
//     setState(() => myDuration = Duration(seconds: 60));
//   }

//   // Step 6
//   void setCountDown() {
//     final reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds - reduceSecondsBy;
//       if (seconds < 0) {
//         countdownTimer!.cancel();
//         isRunning = false;
//         numOfTimesSent++;
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String strDigits(int n) => n.toString().padLeft(2, '0');

//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             // Step 8
//             Text(
//               '$seconds',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 50),
//             ),
//             SizedBox(height: 20),
//             // Step 9
//             ElevatedButton(
//                 onPressed: startTimer,
//                 child: isRunning
//                     ? TextWidget(text: 'Resends in $seconds')
//                     : numOfTimesSent > 1
//                         ? TextWidget(text: "Resend")
//                         : TextWidget(text: "Send Verification")),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TextWidget extends StatelessWidget {
//   const TextWidget({super.key, required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 30,
//       ),
//     );
//   }
// }
