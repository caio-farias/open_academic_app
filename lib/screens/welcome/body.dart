import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/logo.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/ui_config/themes/buttons.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void redirecTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route, arguments: 'animated');
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
            Text('Venha colaborar!\n',
                style: GoogleFonts.roboto(
                    fontSize: 28,
                    color: boldMainTextColor,
                    fontWeight: FontWeight.normal)),
            Text(
                'Várias pessoas usam o Open Academic\npara criar produções acadêmicas.',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: boldMainTextColor,
                    fontWeight: FontWeight.w300))
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () => redirecTo(context, '/register'),
              child: Text('Cadastrar',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              style: flatButtonStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Já tem uma conta?',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: secTextColor,
                        fontWeight: FontWeight.normal)),
                TextButton(
                    onPressed: () => redirecTo(context, '/login'),
                    child: Text('Entrar',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: mainPurple,
                            fontWeight: FontWeight.normal)))
              ],
            )
          ],
        )
      ],
    );
  }
}
