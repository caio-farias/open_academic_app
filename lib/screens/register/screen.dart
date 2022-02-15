import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/appbar.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/screens/register/body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
