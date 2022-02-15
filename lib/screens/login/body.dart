import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/logo.dart';
import 'package:open_academic_app/common/repositories/auth_repo.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/ui_config/themes/buttons.dart';
import 'package:open_academic_app/common/utils/utils.dart';
import 'package:open_academic_app/screens/login/components/login_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

Future<void> _showDialogBox(BuildContext context, String message) async {
  await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: Text(
              message,
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text('Voltar'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          ));
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

  void _attemptLogin() async {
    try {
      await _authRepository.authenticate(
          emailController.value.text, passwordController.value.text);
      redirecTo(context, '/search-page', 'animated');
    } catch (e) {
      _showDialogBox(context, 'Ocorreu um erro no servidor..');
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
              child: Text('Entrar',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            TextButton(
                onPressed: null,
                child: Text('Esqueceu a senha?',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: secTextColor,
                        fontWeight: FontWeight.normal)))
          ],
        )
      ],
    );
  }
}
