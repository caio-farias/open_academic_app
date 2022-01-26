import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading(
      {Key? key,
      required this.width,
      required this.height,
      required this.color})
      : super(key: key);

  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: width,
          height: height,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(darkBlue),
          )),
    );
  }
}
