import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Constants {
  static const primaryColor = Color(0xFF09AD56);
  static const tileContentClickColor = Colors.white;
  static const textColor = Color(0xFF1C173B);
  static const initialBgColor = Color(0xFFEFEFEF);
  static const finalBgColor = Color(0xFF044F27);
  static const tileHeight = 140.0;
  static const leftPadding = 20.0;
  static const borderRadius = Radius.circular(15);
  static const launchAnimationDuration = Duration(milliseconds: 400);

  static TextStyle textStyle(double fontSize) {
    return GoogleFonts.poppins(
      color: Constants.textColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }
}
