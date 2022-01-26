import 'package:flutter/material.dart';
import 'package:open_academic_app/screens/register/components/models/create_user_dto.dart';

class FormData {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _passwordConfirmationController;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  String _roleDropdownValue = 'Acadêmico';
  bool _termsCheckboxValue = false;

  get getEmailController => _emailController;
  get getPasswordController => _passwordController;
  get getPasswordConfirmationController => _passwordConfirmationController;
  get getFirstNameController => _firstNameController;
  get getLastNameController => _lastNameController;
  get getRoleDropdownValue => _roleDropdownValue;
  get getTermsCheckboxValue => _termsCheckboxValue;

  get getFormValue {
    return UserDTO(
        getFirstNameController.text,
        getLastNameController.text,
        getPasswordConfirmationController.text,
        getEmailController.text,
        [getRoleDropdownValue]);
  }

  set setTermsCheckboxValue(bool value) {
    _termsCheckboxValue = value;
  }

  set setRoleDropdownValue(String value) {
    _roleDropdownValue = value;
  }

  FormData(
    this._emailController,
    this._passwordController,
    this._passwordConfirmationController,
    this._firstNameController,
    this._lastNameController,
  );
}
