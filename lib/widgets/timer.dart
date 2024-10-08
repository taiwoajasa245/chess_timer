import 'package:flutter/material.dart';

class TimerUi extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;

  const TimerUi({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  bool timerColor() {
    if (hours == 0 && minutes == 0 && seconds <= 20) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle kTimerTextStyle = TextStyle(
      color: !timerColor() ? Colors.white : Colors.red,
      fontSize: 50,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // hours
            Text(
              '${hours < 10 ? '0${hours.toString()}' : hours.toString()} : ',
              style: kTimerTextStyle,
            ),
            // minutes
            Text(
              '${minutes < 10 ? '0${minutes.toString()}' : minutes.toString()} : ',
              style: kTimerTextStyle,
            ),
            // seconds
            Text(
              seconds < 10 ? '0${seconds.toString()}' : seconds.toString(),
              style: kTimerTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
