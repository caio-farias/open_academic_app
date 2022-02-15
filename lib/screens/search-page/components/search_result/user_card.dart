import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/stores/selected_user_store/selected_user.store.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/utils/utils.dart';
import 'user_card_body.dart';

Widget buildUserCard(BuildContext context, User user) {
  final _selectedUserStore = GetIt.I.get<SelectedUserStore>();

  void _selectUserAndGoToProfile() {
    _selectedUserStore.storeUser(user);
    redirecTo(context, '/profile');
  }

  return GestureDetector(
    onTap: () => _selectUserAndGoToProfile(),
    child: Container(
      decoration: const BoxDecoration(
        color: mainPurple,
      ),
      constraints: const BoxConstraints(
          maxWidth: 300, maxHeight: 150, minWidth: 300, minHeight: 150),
      child: buildUserCardBody(context, user),
    ),
  );
}
