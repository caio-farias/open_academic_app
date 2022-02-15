import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/screens/welcome/body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgMainWhite,
      body: SafeArea(child: Body()),
    );
  }
}
