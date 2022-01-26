import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

final TextTheme defaultTextTheme = TextTheme(
  headline1: GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: boldMainTextColor,
  ),
  subtitle1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: boldMainTextColor,
  ),
  headline2: GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: mainTextColor,
  ),
  bodyText1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: mainTextColor,
  ),
  bodyText2: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: secTextColor,
  ),
);

final TextTheme userProfile = TextTheme(
  caption: GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: boldMainTextColor,
  ),
  bodyText1: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: boldMainTextColor,
  ),
);
