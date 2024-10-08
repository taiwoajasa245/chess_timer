import 'package:flutter/material.dart';

class AppSecond extends StatelessWidget {
  final int secs;

  const AppSecond({super.key, required this.secs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          secs < 10 ? '0${secs.toString()}' : secs.toString(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
