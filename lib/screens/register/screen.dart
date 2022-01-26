import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/appbar.dart';
import 'package:open_academic_app/screens/register/body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: defaultAppbar(context),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Body(),
      ),
    );
  }
}
