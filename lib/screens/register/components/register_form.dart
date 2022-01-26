import 'package:flutter/material.dart';
import 'package:open_academic_app/screens/register/components/form_body.dart';
import 'package:open_academic_app/screens/register/components/models/form_data.dart';

class RegisterForm extends StatefulWidget {
  final FormData formData;
  const RegisterForm({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final FormData formData;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    formData = widget.formData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FormBody(
          formData: formData,
        ),
      ),
    );
  }
}
