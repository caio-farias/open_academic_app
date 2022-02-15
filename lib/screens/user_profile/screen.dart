import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/components/appbar.dart';
import 'package:open_academic_app/common/stores/models/user.dart';
import 'package:open_academic_app/common/stores/selected_user_store/selected_user.store.dart';
import 'package:open_academic_app/common/stores/user_store/user.store.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/utils/utils.dart';
import 'package:open_academic_app/screens/user_profile/body.dart';

class UserProfileScreen extends StatefulWidget {
  final bool isCurrentUserProfile;
  const UserProfileScreen({Key? key, required this.isCurrentUserProfile})
      : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _selectedUserStore = GetIt.I.get<SelectedUserStore>();
  final _userStore = GetIt.I.get<UserStore>();
  late final UserStoreModel user;

  @override
  void initState() {
    super.initState();
    user = widget.isCurrentUserProfile
        ? _userStore.getUser
        : _selectedUserStore.getUser;
  }

  void _logout() async {
    await _userStore.logout();
    redirecTo(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        extendBodyBehindAppBar: false,
        appBar: appBarWithUserInfo(
          context,
          user.getProfilePhoto,
          '${user.getFirstName} ${user.getLastName}',
          user.getRoles!.isNotEmpty ? user.getRoles![0] : 'Acadêmico',
          () => redirecTo(context, 'profile'),
          () => _logout(),
        ),
        backgroundColor: veryDarkBlue,
        body: Body(
          isCurrentUserProfile: widget.isCurrentUserProfile,
        ),
      ),
    );
  }
}
