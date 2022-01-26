import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/components/error_message.dart';
import 'package:open_academic_app/screens/home/screen.dart';
import 'package:open_academic_app/screens/login/screen.dart';
import 'package:open_academic_app/screens/register/screen.dart';
import 'package:open_academic_app/screens/search-page/screen.dart';
import 'package:open_academic_app/screens/welcome/screen.dart';
import 'package:open_academic_app/common/utils/transitions.dart';
import 'common/stores/user.store.dart';

class RoutesGerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    bool isAuth = true;
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/welcome':
        return TransitionPageRoute(
            widget: isAuth ? const SearchPageScreen() : const WelcomeScreen());
      case '/home':
        return args is String && args == 'animated'
            ? TransitionPageRoute(widget: const HomeScreen())
            : MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/search-page':
        return MaterialPageRoute(builder: (_) => const SearchPageScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => SafeArea(
        child: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [ErrorMessage()],
          ),
        ),
      ),
    );
  }
}
