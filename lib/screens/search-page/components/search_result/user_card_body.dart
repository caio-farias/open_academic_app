import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/screens/search-page/components/search_result/interests_wrapper.dart';

Widget buildUserCardBody(BuildContext context, User user) {
  String? firstName = user.firstName;
  String? lastName = user.lastName;
  num? prodCount = user.productionsCount;
  String? grad = user.getGradDegree(0).degreeSubject;
  String? gradUni = user.getGradDegree(0).university;
  String? master = user.getMasterDegree(0).degreeSubject;
  String? masterUni = user.getMasterDegree(0).university;

  return Padding(
    padding: const EdgeInsets.only(top: 14.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userLeftIndo(user, prodCount),
        const SizedBox(
          width: 18,
        ),
        userMainInfo(firstName, lastName, grad, gradUni, master, masterUni,
            user.getInterests()),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (user.grade != null)
              Text(user.grade.toString(),
                  style: GoogleFonts.roboto(
                    color: bgMainWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  )),
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 16,
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildDegreeCard(
    String degreeType, String degreeSubject, String degreeUni) {
  return Padding(
    padding: const EdgeInsets.only(top: 3),
    child: Text(
      '$degreeType em $degreeSubject',
      style: GoogleFonts.roboto(
        color: bgMainWhite,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    ),
  );
}

SizedBox userMainInfo(
    String? firstName,
    String? lastName,
    String? grad,
    String? gradUni,
    String? master,
    String? masterUni,
    List<Interests> interests) {
  return SizedBox(
    width: 180,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              firstName! + ' ' + lastName!,
              style: GoogleFonts.roboto(
                color: bgMainWhite,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (grad!.isNotEmpty)
          Text('Formação',
              style: GoogleFonts.roboto(
                color: bgMainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              )),
        if (grad.isNotEmpty) buildDegreeCard("Bacharel", grad, gradUni!),
        if (master!.isNotEmpty) buildDegreeCard("Mestre", master, masterUni!),
        buildInterests(interests)
      ],
    ),
  );
}

SizedBox userLeftIndo(User user, num? prodCount) {
  return SizedBox(
    width: 100,
    child: Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: NetworkImage(
                user.profilePhoto == null
                    ? "https://lolitajoias.com.br/wp-content/uploads/2020/09/no-image.jpg"
                    : user.profilePhoto!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '$prodCount +',
          style: GoogleFonts.righteous(
            color: bgMainWhite,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(
          'produções',
          style: GoogleFonts.roboto(
            color: bgMainWhite,
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        )
      ],
    ),
  );
}
