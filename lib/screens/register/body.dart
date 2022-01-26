import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/logo.dart';
import 'package:open_academic_app/common/repositories/users_repo.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/ui_config/themes/buttons.dart';
import 'package:open_academic_app/screens/register/components/models/form_data.dart';
import 'package:open_academic_app/screens/register/components/register_form.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FormData formData = FormData(
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  );
  late UsersRepository _usersRepository;

  void redirecTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void initState() {
    _usersRepository = UsersRepository();
    super.initState();
  }

  void _attemptRegister() async {
    if (!formData.getTermsCheckboxValue) return;
    try {
      await _usersRepository.registerAndAuthenticate(formData.getFormValue);
      redirecTo(context, '/search-page');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(size: '128'),
        RegisterForm(
          formData: formData,
        ),
        Column(
          children: [
            TextButton(
              style: flatButtonStyle,
              onPressed: _attemptRegister,
              child: Text(
                'Começar a usar',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem uma conta?',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text('Entrar',
                        style: TextStyle(color: mainPurple))),
              ],
            )
          ],
        )
      ],
    );
  }
}
