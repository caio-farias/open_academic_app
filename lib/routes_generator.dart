import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/error_message.dart';
import 'package:open_academic_app/screens/login/screen.dart';

import 'package:open_academic_app/screens/register/screen.dart';
import 'package:open_academic_app/screens/search-page/screen.dart';
import 'package:open_academic_app/screens/splash_screen/screen.dart';
import 'package:open_academic_app/common/utils/transitions.dart';
import 'package:open_academic_app/screens/user_profile/screen.dart';
import 'package:open_academic_app/screens/welcome/screen.dart';

class RoutesGerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/welcome':
        return args is String && args == 'animated'
            ? TransitionPageRoute(widget: const WelcomeScreen())
            : MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/search-page':
        return args is String && args == 'animated'
            ? TransitionPageRoute(widget: const SearchPageScreen())
            : MaterialPageRoute(builder: (_) => const SearchPageScreen());
      case '/login':
        return args is String && args == 'animated'
            ? TransitionPageRoute(widget: const LoginScreen())
            : MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return args is String && args == 'animated'
            ? TransitionPageRoute(widget: const RegisterScreen())
            : MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/profile':
        return args is String && args == 'currentUser'
            ? MaterialPageRoute(
                builder: (_) => const UserProfileScreen(
                      isCurrentUserProfile: true,
                    ))
            : MaterialPageRoute(
                builder: (_) => const UserProfileScreen(
                      isCurrentUserProfile: false,
                    ));
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
