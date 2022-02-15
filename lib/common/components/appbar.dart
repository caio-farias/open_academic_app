import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/utils/utils.dart';
import 'logo.dart';

AppBar defaultAppbar(BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        splashRadius: 25,
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

PreferredSize noBackAppbarWithProfileLink(
        BuildContext context, String? profilePhoto, VoidCallback onPressed) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Logo(size: '64'),
          centerTitle: true,
          actions: [
            IconButton(
              iconSize: 24,
              icon: Transform.translate(
                offset: const Offset(0, -10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          profilePhoto ??
                              "https://lolitajoias.com.br/wp-content/uploads/2020/09/no-image.jpg",
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );

PreferredSize appBarWithUserInfo(
        BuildContext context,
        String? profilePhoto,
        String fullName,
        String mainRole,
        VoidCallback onPressed,
        VoidCallback logout) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: veryDarkBlue,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(children: [
          SizedBox(
            child: CustomPaint(
              size: const Size(1000, 400),
              painter: CurvePainter(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              profilePhoto ??
                                  "https://lolitajoias.com.br/wp-content/uploads/2020/09/no-image.jpg",
                            ),
                            fit: BoxFit.contain),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      fullName,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      mainRole,
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
        leading: IconButton(
          splashRadius: 25,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            splashRadius: 25,
            icon: const Icon(Icons.logout_outlined, color: Colors.white),
            onPressed: logout,
          ),
        ],
      ),
    );
