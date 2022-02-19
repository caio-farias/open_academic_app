import 'package:flutter/material.dart';
import 'package:open_academic_app/common/models/user.dart';

import 'user_card.dart';

Widget buildUserCardsList(List<User> users) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) => buildUserCard(context, users[index])),
  );
}
