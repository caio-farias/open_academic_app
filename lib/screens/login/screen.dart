import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/appbar.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/screens/login/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context),
        backgroundColor: bgMainWhite,
        body: const Body(),
      ),
    );
  }
}
