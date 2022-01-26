import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

ButtonStyle flatButtonStyle = TextButton.styleFrom(
  textStyle: GoogleFonts.roboto(
    letterSpacing: .75,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: bgMainWhite,
  ),
  backgroundColor: mainPurple,
  minimumSize: const Size(215, 45),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);
