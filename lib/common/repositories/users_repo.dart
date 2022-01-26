import 'dart:convert';

import 'package:open_academic_app/common/api/dio.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/repositories/auth_repo.dart';
import 'package:open_academic_app/screens/register/components/models/create_user_dto.dart';

class UsersRepository {
  final AuthRepository _authRepository = AuthRepository();
  Future<List<User>> getUsers() async {
    var dio = CustomDio.WithAuthorization().instance;
    try {
      var res = await dio.get('/users');
      var users = res.data['data']['users'];
      return users.map<User>((user) => User.fromJson(user)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<User> register(UserDTO user) async {
    final dio = CustomDio().instance;
    try {
      var res = await dio.post('/users',
          data: jsonEncode(<String, dynamic>{
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'password': user.password,
            'roles': user.roles,
          }));
      return User.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> registerAndAuthenticate(UserDTO user) async {
    final dio = CustomDio().instance;
    try {
      var res = await dio.post('/users',
          data: jsonEncode(<String, dynamic>{
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'password': user.password,
            'roles': user.roles,
          }));
      await _authRepository.authenticate(user.email, user.password);
      return User.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
