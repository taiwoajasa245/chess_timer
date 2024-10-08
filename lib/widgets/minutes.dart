import 'package:flutter/material.dart';

class AppMinutes extends StatelessWidget {
  final int mins;

  const AppMinutes({super.key, required this.mins});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Center(
          child: Text(
            mins < 10 ? '0${mins.toString()}' : mins.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
