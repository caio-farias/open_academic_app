import 'package:flutter/material.dart';

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
          decoration: InputDecoration(
              label: const Text('E-mail'),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          validator: (value) {
            if (value!.isEmpty) return 'E-mail é um campo obrigatório';
            return null;
          },
        ),
        TextFormField(
          controller: passwordController,
          autocorrect: true,
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
              label: const Text('Senha'),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          validator: (value) {
            if (value!.isEmpty) return 'Senha é um campo obrigatório';
            return null;
          },
        ),
      ],
    );
  }
}
