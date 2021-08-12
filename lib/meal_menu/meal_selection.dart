import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class MealSelection extends StatelessWidget {
  final Widget restartContainer;
  final String imageUrl;
  final String imageCaption;
  MealSelection({
    required this.restartContainer,
    required this.imageUrl,
    required this.imageCaption,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.finalBgColor,
      body: Column(
        children: [
          restartContainer,
          FractionallySizedBox(
            widthFactor: 0.95,
            child: Image.asset(
              imageUrl,
            ),
          ),
          SizedBox(height: 16),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Text(
              imageCaption.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
