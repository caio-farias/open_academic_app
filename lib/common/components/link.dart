import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildLink(String url, String iconName) {
  void _launchURL() async {
    try {
      if (!await launch(url)) throw 'Could not launch $url';
    } catch (e) {
      rethrow;
    }
  }

  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: GestureDetector(
      onTap: () => _launchURL(),
      child: SvgPicture.asset("assets/icons/$iconName.svg"),
    ),
  );
}
