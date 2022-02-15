import 'package:flutter/material.dart';
import 'package:open_academic_app/common/stores/models/user.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/screens/user_profile/components/user_profile_aboutme.dart';
import 'package:open_academic_app/screens/user_profile/components/user_profile_education.dart';
import 'package:open_academic_app/screens/user_profile/components/user_profile_header.dart';

class UserProfileBody extends StatefulWidget {
  final UserStoreModel user;
  const UserProfileBody({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  String selectedSection = 'Sobre mim';

  void _handleTap(String section) {
    setState(() {
      if (selectedSection != section) selectedSection = section;
    });
  }

  Widget buildContent() => selectedSection == "Sobre mim"
      ? UserProfileAboutMe(
          aboutMe: widget.user.getAboutMe,
          links: widget.user.getSocialLinks,
          interests: widget.user.getQualifications!.interests,
        )
      : UserProfileEducation(
          education: widget.user.getQualifications!.education,
        );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
                height: 20,
                decoration: const BoxDecoration(
                    color: veryDarkBlue,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)))),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: buildContent(),
              ),
            ),
          ],
        ),
        UserProfileHeader(
          selectedSection: selectedSection,
          handleTap: _handleTap,
        ),
      ],
    );
  }
}
