import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController emailController;
  const LoginForm(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = widget.emailController;
    passwordController = widget.passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FormBody(
              emailController: emailController,
              passwordController: passwordController)),
    );
  }
}

class FormBody extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const FormBody(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = widget.emailController;
    passwordController = widget.passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          autocorrect: true,
          maxLines: 1,
          cursorColor: secTextColor,
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.normal, color: secTextColor),
          decoration: InputDecoration(
              label: Text(
                'E-mail',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: secTextColor),
              ),
              filled: true,
              fillColor: lightGrey,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: passwordController,
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.normal, color: secTextColor),
          autocorrect: true,
          maxLines: 1,
          cursorColor: secTextColor,
          obscureText: true,
          decoration: InputDecoration(
              label: Text(
                'Senha',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: secTextColor),
              ),
              filled: true,
              fillColor: lightGrey,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
      ],
    );
  }
}
