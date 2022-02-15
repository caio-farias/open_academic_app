import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/stores/models/user.dart';
import 'package:open_academic_app/common/stores/selected_user_store/selected_user.store.dart';
import 'package:open_academic_app/common/stores/user_store/user.store.dart';
import 'package:open_academic_app/screens/user_profile/components/user_profile_body.dart';

class Body extends StatefulWidget {
  final bool isCurrentUserProfile;
  const Body({Key? key, required this.isCurrentUserProfile}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _userStore = GetIt.I.get<UserStore>();
  final _selectedUserStore = GetIt.I.get<SelectedUserStore>();
  late final UserStoreModel user;

  @override
  void initState() {
    if (widget.isCurrentUserProfile) {
      user = _userStore.getUser;
      return;
    }
    user = _selectedUserStore.getUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserProfileBody(
      user: user,
    );
  }
}
