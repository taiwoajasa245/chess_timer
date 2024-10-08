import 'package:flutter/material.dart';
import 'package:chess_timer_flutter/constants/constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.btnText,
    this.height,
    required this.press,
  });
  final double? height;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: press,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: const Color(kBottomButtonColor),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              child: Text(
                btnText!,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            SizedBox(height: height ?? 20.0),
          ],
        ),
      ),
    );
  }
}
