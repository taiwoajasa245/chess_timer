import 'package:chess_timer_flutter/screens/timer_screen.dart';
import 'package:chess_timer_flutter/widgets/hours.dart';
import 'package:chess_timer_flutter/widgets/minutes.dart';
import 'package:chess_timer_flutter/widgets/seconds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chess_timer_flutter/widgets/bottom_btn.dart';

class StartTimerScreen extends StatefulWidget {
  const StartTimerScreen({super.key});

  @override
  State<StartTimerScreen> createState() => _StartTimerScreenState();
}

class _StartTimerScreenState extends State<StartTimerScreen> {
  late FixedExtentScrollController _hoursController;
  late FixedExtentScrollController _minController;
  late FixedExtentScrollController _secController;

  @override
  void initState() {
    super.initState();
    _hoursController = FixedExtentScrollController();
    _minController = FixedExtentScrollController();
    _secController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _hoursController.dispose();
    _minController.dispose();
    _secController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/Splash Screen.png"), // Your image asset
            fit: BoxFit.cover, // Adjust the image to fill the screen
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // header image
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icons_clock.png',
                    ),
                  ],
                ),
              ),

              // scroll wheel
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // hours wheel
                    SizedBox(
                      width: 50,
                      child: ListWheelScrollView.useDelegate(
                        controller: _hoursController,
                        itemExtent: 50,
                        perspective: 0.003,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 24,
                          builder: (context, index) {
                            return AppHours(
                              hours: index,
                            );
                          },
                        ),
                      ),
                    ),

                    const Text(
                      ':',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // minutes wheel
                    SizedBox(
                      width: 50,
                      child: ListWheelScrollView.useDelegate(
                        controller: _minController,
                        itemExtent: 50,
                        perspective: 0.003,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            return AppMinutes(
                              mins: index,
                            );
                          },
                        ),
                      ),
                    ),

                    const Text(
                      ':',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // seconds wheel
                    SizedBox(
                      width: 50,
                      child: ListWheelScrollView.useDelegate(
                        controller: _secController,
                        itemExtent: 50,
                        perspective: 0.003,
                        diameterRatio: 1.2,
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            return AppSecond(
                              secs: index,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),

              // start button
              BottomButton(
                btnText: "Set",
                height: 20,
                press: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => TimerScreen(
                        hours: _hoursController.selectedItem.toString(),
                        min: _minController.selectedItem.toString(),
                        sec: _secController.selectedItem.toString(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
