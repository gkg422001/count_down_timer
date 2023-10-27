import 'package:flutter/material.dart';

class buttonCont extends StatelessWidget {
  const buttonCont({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
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
    );
  }
}
