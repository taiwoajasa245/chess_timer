import 'package:flutter/material.dart';

class AppHours extends StatelessWidget {
  final int hours;

  const AppHours({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          hours < 10 ? '0${hours.toString()}' : hours.toString(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
