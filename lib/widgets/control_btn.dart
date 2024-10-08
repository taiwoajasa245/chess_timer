import 'package:chess_timer_flutter/widgets/rounded_svg.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final VoidCallback playBtn;
  final VoidCallback pauseBtn;
  final VoidCallback resetBtn;

  const ControlButton(
      {super.key,
      required this.playBtn,
      required this.pauseBtn,
      required this.resetBtn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedButton(
          onPressed: resetBtn,
          svgPath: 'assets/images/reload_btn.svg',
          borderRadius: 50.0,
          isBtn: true,
        ),
        const SizedBox(
          width: 50,
        ),
        RoundedButton(
          onPressed: playBtn,
          svgPath: 'assets/images/play_btn.svg',
          borderRadius: 100.0,
          isBtn: false,
        ),
        const SizedBox(
          width: 50,
        ),
        RoundedButton(
          onPressed: pauseBtn,
          svgPath: 'assets/images/pause_btn.svg',
          borderRadius: 50.0,
          isBtn: true,
        ),
      ],
    );
  }
}
