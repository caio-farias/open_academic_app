import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/logo.dart';
import 'package:open_academic_app/common/repositories/auth_repo.dart';
import 'package:open_academic_app/common/ui_config/themes/buttons.dart';
import 'package:open_academic_app/screens/login/components/login_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AuthRepository _authRepository;

  @override
  void initState() {
    _authRepository = AuthRepository();
    super.initState();
  }

  void redirecTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  void _attemptLogin() async {
    try {
      await _authRepository.authenticate(
          emailController.value.text, passwordController.value.text);
      redirecTo(context, '/search-page');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Logo(size: '128'),
        LoginForm(
          emailController: emailController,
          passwordController: passwordController,
        ),
        Column(
          children: [
            TextButton(
              style: flatButtonStyle,
              onPressed: _attemptLogin,
              child: Text(
                'Entrar',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background),
              ),
            ),
            TextButton(
                onPressed: null,
                child: Text(
                  'Esqueceu a senha?',
                  style: Theme.of(context).textTheme.bodyText2,
                ))
          ],
        )
      ],
    );
  }
}
