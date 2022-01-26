import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/api/dio.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/stores/user.store.dart';

class AuthRepository {
  final _userStore = GetIt.I.get<UserStore>();

  Future<bool> authenticate(String email, String password) async {
    final dio = CustomDio().instance;
    try {
      var res = await dio.post('/auth/login',
          data: jsonEncode(
              <String, String>{'username': email, 'password': password}));
      final user = User.fromJson(res.data['user']);
      storeUserData(user);
      setAccessToken(res.data['access_token']);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  void storeUserData(User user) async => _userStore.storeUser(user);
  void setAccessToken(String newAccessToken) async =>
      _userStore.storeAccesstoken(newAccessToken);
}
