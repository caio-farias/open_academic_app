import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/logo.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/ui_config/themes/buttons.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void redirecTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Logo(size: '64'),
        Image.asset('assets/images/flame-searching.png'),
        Column(
          children: [
            Text(
              'Venha colaborar!\n',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Várias pessoas usam o Open Academic\npara criar produções acadêmicas.',
              style: TextStyle(
                fontStyle: Theme.of(context).textTheme.bodyText1!.fontStyle,
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontWeight: FontWeight.w100,
              ),
            )
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () => redirecTo(context, '/register'),
              child: Text(
                'Cadastrar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              style: flatButtonStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem uma conta?',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextButton(
                    onPressed: () => redirecTo(context, '/login'),
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
