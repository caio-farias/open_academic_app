import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/link.dart';
import 'package:open_academic_app/common/components/topic.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class UserProfileAboutMe extends StatelessWidget {
  const UserProfileAboutMe(
      {Key? key,
      required this.interests,
      required this.links,
      required this.aboutMe})
      : super(key: key);
  final List<Interests>? interests;
  final List<SocialLinks>? links;
  final String? aboutMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 34, right: 34),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildAboutMeSection(context, aboutMe ?? ''),
            buildKnowMyWorkSection(context, links!),
            InterestsList(interests: interests!),
          ],
        ),
      ),
    );
  }
}

Widget buildAboutMeSection(BuildContext context, String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Sobre mim',
            style: GoogleFonts.montserrat(
                color: veryDarkBlue, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          content,
          style: GoogleFonts.montserrat(
              color: grey, fontSize: 11, fontWeight: FontWeight.normal),
        )
      ],
    ),
  );
}

Widget buildKnowMyWorkSection(BuildContext context, List<SocialLinks> content) {
  return content.isNotEmpty
      ? Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Conheça meu trabalho',
                  style: GoogleFonts.montserrat(
                      color: veryDarkBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
              buildLinkWrapper(context, content)
            ],
          ),
        )
      : const SizedBox();
}

Widget buildLinkWrapper(BuildContext context, List<SocialLinks> content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (content[0].link!.isNotEmpty)
        buildLink(content[0].link!, "linkedin-icon"),
      if (content[1].link!.isNotEmpty)
        buildLink(content[1].link!, "escavador-icon"),
      if (content[2].link!.isNotEmpty)
        buildLink(content[2].link!, "lattes-icon"),
    ],
  );
}

class InterestsList extends StatelessWidget {
  const InterestsList({Key? key, required this.interests}) : super(key: key);
  final List<Interests> interests;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Interesses",
            style: GoogleFonts.montserrat(
                color: veryDarkBlue, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
        ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) => Flexible(
                  child: buildTopic(
                    context,
                    interests[index].subject!,
                    interests[index].description!,
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 15,
                ),
            itemCount: interests.length),
      ],
    );
  }
}
