import 'package:open_academic_app/common/components/appbar.dart';
import 'package:open_academic_app/screens/home/components/body.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: softWhite,
        body: const Body(),
        appBar: defaultAppbar(context));
  }
}
