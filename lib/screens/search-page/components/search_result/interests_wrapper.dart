import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

Widget buildInterests(List<Interests> interests) {
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Interesses',
              style: GoogleFonts.roboto(
                color: bgMainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              )),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                primary: false,
                physics: null,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    interests[index].subject != null
                        ? buildInterest(interests[index].subject)
                        : const SizedBox(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 5,
                    ),
                itemCount: interests.length),
          ),
        ],
      ),
    ),
  );
}

Widget buildInterest(String? interestName) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: SvgPicture.asset(
          "assets/icons/bullet-point-white.svg",
          width: 8,
          height: 8,
        ),
      ),
      Text(interestName!,
          style: GoogleFonts.roboto(
            color: bgMainWhite,
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ))
    ],
  );
}
