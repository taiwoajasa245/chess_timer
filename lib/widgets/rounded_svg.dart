import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String svgPath;
  final double borderRadius;
  final EdgeInsets padding;
  final bool isBtn;

  const RoundedButton({
    super.key,
    required this.isBtn,
    required this.onPressed,
    required this.svgPath,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: isBtn
          ? SvgPicture.asset(svgPath)
          : const Text(
              'Pause',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
    );
  }
}
