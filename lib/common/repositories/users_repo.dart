import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/api/dio.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/repositories/auth_repo.dart';
import 'package:open_academic_app/common/stores/filter_store/filter.store.dart';
import 'package:open_academic_app/screens/register/components/models/create_user_dto.dart';

class UsersRepository {
  final AuthRepository _authRepository = AuthRepository();
  final _filterStore = GetIt.I.get<FilterStore>();

  Future<List<User>> getUsers([String searchValue = '']) async {
    var dio = CustomDio.WithAuthorization().instance;
    try {
      List<String> fullName = searchValue.split(' ');
      var res = await dio.get('/users', queryParameters: <String, dynamic>{
        'firstName': fullName[0],
        'lastName': fullName.length > 1 ? fullName[1] : '',
        'roles': _filterStore.getSearchFilter.roles.content,
        'languages': _filterStore.getSearchFilter.languages.content,
        'education': _filterStore.getSearchFilter.education.content,
        'expirienceTime': _filterStore.getSearchFilter.expirienceTime.content,
      });
      var users = res.data['data']['users'];
      return users.map<User>((user) => User.fromJson(user)).toList();
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
