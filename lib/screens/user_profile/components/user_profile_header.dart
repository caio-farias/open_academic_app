import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader(
      {Key? key, required this.selectedSection, required this.handleTap})
      : super(key: key);
  final String selectedSection;
  final ValueChanged<String> handleTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildSectionPicker(
            context, "Sobre mim", "head", selectedSection == "Sobre mim"),
        buildSectionPicker(
            context, "Formação", "capel", selectedSection == "Formação")
      ],
    ));
  }

  Widget separatorBuilder(BuildContext context, int index) =>
      const SizedBox(width: 50);

  Widget buildSectionPicker(
      BuildContext context, String title, String iconName, bool isSelected) {
    return GestureDetector(
      onTap: () => handleTap(title),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          width: 125,
          height: 50,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                "assets/icons/${isSelected ? iconName + "-selected" : iconName}.svg",
                width: 20,
                height: 20,
              ),
              Text(
                title,
                style: GoogleFonts.montserrat(
                    color: isSelected ? darkBlue : darkBlueLowOpacity,
                    fontSize: 11),
              ),
            ],
          ))),
    );
  }
}
