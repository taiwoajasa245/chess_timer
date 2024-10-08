// import 'package:chess_timer_flutter/screens/start_timer_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:chess_timer_flutter/widgets/bottom_btn.dart';
// import 'package:flutter/cupertino.dart';
//
// class ChessTimerHomeScreen extends StatelessWidget {
//   const ChessTimerHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child: Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image:
//               AssetImage("assets/images/Splash Screen.png"), // Your image asset
//           fit: BoxFit.cover, // Adjust the image to fill the screen
//         ),
//       ),
//       child: SafeArea(
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/logo.png',
//                       height: 145,
//                       width: 145,
//                     ),
//                     const SizedBox(
//                       height: 20.0,
//                     ),
//                     const Text(
//                       'CHESS TIMER',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                         fontFamily: 'Nunito',
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               BottomButton(
//                 btnText: "Play",
//                 height: 40.0,
//                 press: () {
//                   Navigator.push(
//                     context,
//                     CupertinoPageRoute(
//                       builder: (context) => const StartTimerScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
//
//

import 'package:chess_timer_flutter/screens/set_timer_screen.dart';
import 'package:chess_timer_flutter/widgets/bottom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChessTimerHomeScreen extends StatelessWidget {
  const ChessTimerHomeScreen({super.key});

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
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 145,
                      width: 145,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'CHESS TIMER',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                btnText: "Play",
                height: 40.0,
                press: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const StartTimerScreen(),
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
