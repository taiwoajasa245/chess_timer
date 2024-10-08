import 'dart:ui'; // Import for the blur effect
import 'package:flutter/material.dart';

Future<bool?> showStopTimerDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible:
        false, // Prevents dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply the blur effect
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Would you like to stop the timer?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true); // Return 'Yes'
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Yes button color
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false); // Return 'No'
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // No button color
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
