import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

Widget buildTopic(BuildContext context, String title, String content) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: SvgPicture.asset("assets/icons/bullet-point.svg"),
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.w600, color: grey),
        )
      ],
    ),
    Text(
      content,
      style: GoogleFonts.montserrat(
          fontSize: 10, fontWeight: FontWeight.w400, color: grey),
    )
  ]);
}
