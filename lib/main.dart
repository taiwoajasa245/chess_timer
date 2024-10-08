import 'package:flutter/material.dart';
import 'package:chess_timer_flutter/screens/home_screen.dart';

void main() {
  runApp(const ChessApp());
}

class ChessApp extends StatelessWidget {
  const ChessApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Chess Timer',
      home: ChessTimerHomeScreen(),
    );
  }
}
