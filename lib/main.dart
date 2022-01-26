import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/stores/user.store.dart';
// import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/ui_config/themes/colors.dart';

import 'common/ui_config/themes/text.dart';
import 'routes_generator.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<UserStore>(UserStore());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _userStore = GetIt.I.get<UserStore>();
  @override
  void initState() {
    _userStore.loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Academic',
      theme: ThemeData(
        textTheme: defaultTextTheme,
        colorScheme: defaultColorScheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RoutesGerator.generateRoutes,
    );
  }
}
