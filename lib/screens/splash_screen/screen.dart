import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/components/logo.dart';
import 'package:open_academic_app/common/stores/user_store/user.store.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _userStore = GetIt.I.get<UserStore>();
  static const int delay = 500;

  void _loadDataFromPrefs() async {
    if (!_userStore.getIsUserAuthenticated) await _userStore.loadUserData();
    return redirectAnimatedAndCleanNavigatorHist(
      _userStore.getIsUserAuthenticated ? '/search-page' : '/welcome',
      context,
      delay,
    );
  }

  @override
  void initState() {
    _loadDataFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgMainWhite,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Center(child: Logo(size: '128')),
      ],
    );
  }
}
