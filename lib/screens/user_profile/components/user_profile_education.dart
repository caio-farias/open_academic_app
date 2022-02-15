import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/topic.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class UserProfileEducation extends StatelessWidget {
  const UserProfileEducation({Key? key, required this.education})
      : super(key: key);
  final Education? education;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 34, right: 34),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Formação",
                style: GoogleFonts.montserrat(
                    color: veryDarkBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            if (education!.gradDegrees!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: EducationList(
                    degreeType: "Graduação", degrees: education!.gradDegrees),
              ),
            if (education!.masterDegrees!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: EducationList(
                    degreeType: "Mestrado", degrees: education!.masterDegrees),
              ),
            if (education!.phdDegrees!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: EducationList(
                    degreeType: "Doutorado", degrees: education!.phdDegrees),
              ),
            if (education!.specializations!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SpecializationList(
                    degreeType: "Especializações",
                    specializations: education!.specializations),
              )
          ],
        ),
      ),
    );
  }
}

class EducationList extends StatelessWidget {
  const EducationList(
      {Key? key, required this.degrees, required this.degreeType})
      : super(key: key);
  final List<Degree>? degrees;
  final String degreeType;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            degreeType,
            style: GoogleFonts.montserrat(
                color: veryDarkBlue, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) => Flexible(
                  child: buildEducationTopic(
                    context,
                    degrees![index].degreeSubject!,
                    degrees![index].university!,
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 10,
                ),
            itemCount: degrees!.length),
      ],
    );
  }
}

class SpecializationList extends StatelessWidget {
  const SpecializationList(
      {Key? key, required this.specializations, required this.degreeType})
      : super(key: key);
  final List<Specializations>? specializations;
  final String degreeType;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            degreeType,
            style: GoogleFonts.montserrat(
                color: veryDarkBlue, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) => Flexible(
                  child: buildEducationTopic(
                    context,
                    specializations![index].subject!,
                    specializations![index].institution!,
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 10,
                ),
            itemCount: specializations!.length),
      ],
    );
  }
}

Widget buildEducationTopic(BuildContext context, String title, String content) {
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
    Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Text(
        content,
        style: GoogleFonts.montserrat(
            fontSize: 10, fontWeight: FontWeight.w400, color: grey),
      ),
    )
  ]);
}
