import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String size;
  const Logo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/logos/logo$size.svg');
  }
}
