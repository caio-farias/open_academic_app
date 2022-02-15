import 'package:flutter/material.dart';

class FullScreenDialogDemo extends StatelessWidget {
  final Widget body;
  const FullScreenDialogDemo({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: body);
  }
}
