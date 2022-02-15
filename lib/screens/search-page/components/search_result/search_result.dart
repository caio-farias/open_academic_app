import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/loading.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'user_card_list.dart';

Widget buildSearchResult(BuildContext context, Future<List<User>> users) {
  return FutureBuilder<List<User>>(
      future: users,
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (!snapshot.hasData ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Loading(
            width: 100,
            height: 100,
            color: Colors.blue,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('ERROR'),
          );
        }
        final users = snapshot.data;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 10),
              child: Text(
                users!.length > 1
                    ? '${users.length} resultados'
                    : '${users.length} resultado',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: secTextColor,
                ),
              ),
            ),
            buildUserCardsList(users),
          ],
        );
      });
}
