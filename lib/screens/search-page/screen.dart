import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/components/appbar.dart';
import 'package:open_academic_app/common/stores/user.store.dart';
import 'package:open_academic_app/screens/search-page/body.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  final _userStore = GetIt.I.get<UserStore>();
  late final String? profilePhoto;
  @override
  void initState() {
    profilePhoto = _userStore.getUser.getProfilePhoto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noBackAppbar(context, profilePhoto),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(child: const Body()),
    );
  }
}
