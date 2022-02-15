import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              autocorrect: true,
              maxLines: 1,
              cursorColor: secTextColor,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: secTextColor),
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
              validator: (value) {
                if (value!.isEmpty) return 'E-mail é um campo obrigatório';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: passwordController,
              autocorrect: true,
              obscureText: true,
              maxLines: 1,
              cursorColor: secTextColor,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: secTextColor),
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
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              validator: (value) {
                if (value!.isEmpty) return 'Senha é um campo obrigatório';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: passwordConfirmationController,
              autocorrect: true,
              obscureText: true,
              maxLines: 1,
              cursorColor: secTextColor,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: secTextColor),
              decoration: InputDecoration(
                  label: Text(
                    'Confirme a senha',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Confirmação de senha é um campo obrigatório';
                }
                return null;
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: firstNameController,
                    autocorrect: true,
                    maxLines: 1,
                    cursorColor: secTextColor,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: secTextColor),
                    decoration: InputDecoration(
                        label: Text(
                          'Nome',
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nome é um campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: lastNameController,
                    autocorrect: true,
                    maxLines: 1,
                    cursorColor: secTextColor,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: secTextColor),
                    decoration: InputDecoration(
                        label: Text(
                          'Sobrenome',
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Sobrenome é um campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButton<String>(
              items: dropdownItems,
              value: widget.formData.getRoleDropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: secTextColor),
              onChanged: (String? newValue) {
                setState(() {
                  widget.formData.setRoleDropdownValue = newValue!;
                });
              },
            ),
          ),
          CheckboxListTile(
              activeColor: mainPurple,
              title: Text(
                'Li e aceito os termos de privacidade',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: secTextColor),
              ),
              value: checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue = value!;
                  widget.formData.setTermsCheckboxValue = value;
                });
              }),
        ],
      ),
    );
  }
}
