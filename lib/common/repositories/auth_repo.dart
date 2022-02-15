import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/api/dio.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/stores/user_store/user.store.dart';

class AuthRepository {
  final _userStore = GetIt.I.get<UserStore>();

  Future<bool> authenticate(String email, String password) async {
    final dio = CustomDio().instance;
    try {
      var res = await dio.post('/auth/login',
          data: jsonEncode(
              <String, String>{'username': email, 'password': password}));
      await _userStore.storeAuthCredentials(
          User.fromJson(res.data['user']), res.data['access_token']);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
