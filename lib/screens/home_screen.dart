import 'package:countdown_timer/screens/new_screen.dart';
import 'package:countdown_timer/widgets/button_Cont.dart';
import 'package:countdown_timer/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),

            Container(
              // decoration: BoxDecoration(
              //   color: Colors.black,
              // ),
              height: 200,
              width: 200,
              child: Image.asset('images/profile.jpg'),
            ),
            SizedBox(height: 20),
            buttonCont(text: "Edit Profile"),
            SizedBox(height: 20),
            buttonCont(
              text: "View Something",
            ),
            SizedBox(height: 20),
            buttonCont(
              text: "Do Something",
            ),
            // Text(
            //   '$seconds',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //       fontSize: 50),
            // ),
            SizedBox(height: 20),
            Container(
              height: 30,
              width: 170,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CountdownTimer(); // Replace with the page you want to navigate to
                      },
                    ),
                  );
                },
                child: Text(
                  "Verify Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 201, 202, 202)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            buttonCont(
              text: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//               height: 30,
//               width: 170,
//               child: ElevatedButton(
//                 onPressed: startTimer,
//                 child: isRunning
//                     ? TextWidget(text: 'Resends in $seconds')
//                     : numOfTimesSent > 1
//                         ? TextWidget(text: "Resend")
//                         : TextWidget(text: "Send Code"),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                       const Color.fromARGB(
//                           255, 201, 202, 202)), // Background color
//                   foregroundColor: MaterialStateProperty.all(
//                       Colors.black), // Text color (black)
//                   // shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                   // borderRadius: BorderRadius.circular(10), // Rounded corners
//                   // )),
//                 ),
//               ),
//             ),