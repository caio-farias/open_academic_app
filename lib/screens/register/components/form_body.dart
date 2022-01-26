import 'package:flutter/material.dart';
import 'package:open_academic_app/common/utils/enums.dart';
import 'package:open_academic_app/screens/register/components/models/form_data.dart';

class FormBody extends StatefulWidget {
  final FormData formData;
  const FormBody({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late final TextEditingController passwordConfirmationController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  final List<DropdownMenuItem<String>> dropdownItems =
      enumRoles.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  late String dropdownValue;
  late bool? checkboxValue;

  @override
  void initState() {
    emailController = widget.formData.getEmailController;
    passwordController = widget.formData.getPasswordController;
    passwordConfirmationController =
        widget.formData.getPasswordConfirmationController;
    firstNameController = widget.formData.getFirstNameController;
    lastNameController = widget.formData.getLastNameController;
    dropdownValue = widget.formData.getRoleDropdownValue;
    checkboxValue = widget.formData.getTermsCheckboxValue;
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
          obscureText: true,
          maxLines: 1,
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
        TextFormField(
          controller: passwordConfirmationController,
          obscureText: true,
          autocorrect: true,
          maxLines: 1,
          decoration: InputDecoration(
              label: const Text('Confirmação de senha'),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Confirmação de senha é um campo obrigatório';
            }
            return null;
          },
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstNameController,
                autocorrect: true,
                maxLines: 1,
                decoration: InputDecoration(
                    label: const Text('Nome'),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nome é um campo obrigatório';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: lastNameController,
                autocorrect: true,
                maxLines: 1,
                decoration: InputDecoration(
                    label: const Text('Sobrenome'),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Sobrenome é um campo obrigatório';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        DropdownButton<String>(
          items: dropdownItems,
          value: widget.formData.getRoleDropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: (String? newValue) {
            setState(() {
              widget.formData.setRoleDropdownValue = newValue!;
            });
          },
        ),
        CheckboxListTile(
            title: const Text('Li e aceito os termos de privacidade'),
            value: checkboxValue,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue = value!;
                widget.formData.setTermsCheckboxValue = value;
              });
            }),
      ],
    );
  }
}
