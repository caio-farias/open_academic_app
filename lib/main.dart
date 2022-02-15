import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/stores/selected_user_store/selected_user.store.dart';
import 'package:open_academic_app/common/stores/user_store/user.store.dart';
import 'package:open_academic_app/common/ui_config/themes/cards.dart';
import 'common/stores/filter_store/filter.store.dart';
import 'routes_generator.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<UserStore>(UserStore());
  getIt.registerSingleton<FilterStore>(FilterStore());
  getIt.registerSingleton<SelectedUserStore>(SelectedUserStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Academic',
      theme: ThemeData(
        cardTheme: cardTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RoutesGerator.generateRoutes,
    );
  }
}
