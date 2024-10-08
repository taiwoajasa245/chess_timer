import 'dart:async';

import 'package:chess_timer_flutter/widgets/stop_timer_dialog.dart';
import 'package:chess_timer_flutter/widgets/border_triangle.dart';
import 'package:chess_timer_flutter/widgets/control_btn.dart';
import 'package:chess_timer_flutter/widgets/timer.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  final String hours;
  final String min;
  final String sec;

  const TimerScreen({
    super.key,
    required this.hours,
    required this.min,
    required this.sec,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _hours1 = 0;
  int _minutes1 = 0;
  int _seconds1 = 0;

  int _hours2 = 0;
  int _minutes2 = 0;
  int _seconds2 = 0;

  late Timer _timer1;
  late Timer _timer2;

  late String _activeTimer = ''; // '' means no active timer

  @override
  void initState() {
    super.initState();
    _hours1 = int.parse(widget.hours);
    _minutes1 = int.parse(widget.min);
    _seconds1 = int.parse(widget.sec);

    _hours2 = int.parse(widget.hours);
    _minutes2 = int.parse(widget.min);
    _seconds2 = int.parse(widget.sec);
  }

  void startTimer1() {
    if (_activeTimer == 'timer2') {
      pauseTimer2();
    }
    _activeTimer = 'timer1';
    _timer1 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds1 > 0) {
        _seconds1--;
      } else if (_minutes1 > 0) {
        _minutes1--;
        _seconds1 = 59;
      } else if (_hours1 > 0) {
        _hours1--;
        _minutes1 = 59;
        _seconds1 = 59;
      } else {
        _timer1.cancel();
      }
      setState(() {});
    });
  }

  void startTimer2() {
    if (_activeTimer == 'timer1') {
      pauseTimer1();
    }
    _activeTimer = 'timer2';
    _timer2 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds2 > 0) {
        _seconds2--;
      } else if (_minutes2 > 0) {
        _minutes2--;
        _seconds2 = 59;
      } else if (_hours2 > 0) {
        _hours2--;
        _minutes2 = 59;
        _seconds2 = 59;
      } else {
        _timer2.cancel();
      }
      setState(() {});
    });
  }

  void pauseTimer1() {
    _timer1.cancel();
    _activeTimer = '';
  }

  void pauseTimer2() {
    _timer2.cancel();
    _activeTimer = '';
  }

  void resetTimers() {
    _timer1.cancel();
    _timer2.cancel();
    _hours1 = int.parse(widget.hours);
    _minutes1 = int.parse(widget.min);
    _seconds1 = int.parse(widget.sec);

    _hours2 = int.parse(widget.hours);
    _minutes2 = int.parse(widget.min);
    _seconds2 = int.parse(widget.sec);

    _activeTimer = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash Screen.png"),
            fit: BoxFit.cover, // Adjust the image to fill the screen
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // timer 1
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    startTimer2();
                  },
                  child: Transform.rotate(
                    angle: 3.14,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimerUi(
                            hours: _hours1,
                            minutes: _minutes1,
                            seconds: _seconds1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomPaint(
                painter: TriangleBorderPainter(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: ControlButton(
                    playBtn: () {
                      if (_activeTimer == 'timer1') {
                        pauseTimer1();
                      } else if (_activeTimer == 'timer2') {
                        pauseTimer2();
                      }
                    },
                    pauseBtn: () async {
                      // Yes
                      if (_activeTimer == 'timer1') {
                        pauseTimer1();
                      } else if (_activeTimer == 'timer2') {
                        pauseTimer2();
                      }

                      bool? result = await showStopTimerDialog(context);
                      if (result == true) {
                        resetTimers();
                        Navigator.pop(context);
                      }
                    },
                    resetBtn: () {
                      resetTimers();
                    },
                  ),
                ),
              ),

              // timer 2
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    startTimer1();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimerUi(
                          hours: _hours2,
                          minutes: _minutes2,
                          seconds: _seconds2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
