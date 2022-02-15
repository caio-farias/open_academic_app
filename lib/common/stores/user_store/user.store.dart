import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/stores/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  // ignore: prefer_final_fields
  UserStoreModel _user = UserStoreModel();

  @observable
  String _accessToken = '';

  @computed
  UserStoreModel get getUser => _user;

  @computed
  String get getAccessToken => _accessToken;

  @computed
  bool get getIsUserAuthenticated => _accessToken.isNotEmpty;

  @action
  void storeUser(User newUser) {
    _user.setNewUser = newUser;
  }

  @action
  void storeAccessToken(String newToken) {
    _accessToken = newToken;
  }

  @action
  Future<void> storeAuthCredentials(User newUser, String newToken) async {
    storeUser(newUser);
    storeAccessToken(newToken);
    await _persistUserData();
  }

  @action
  Future<void> _persistUserData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    print('Saving user on prefs..');
    _prefs.setString('accessToken', _accessToken);
    _prefs.setString('user', jsonEncode(_user.toJson()));
  }

  @action
  Future<void> _getUserDataFromSharedPrefs() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('accessToken').toString().isNotEmpty) {
      print('Loading users from prefs..');
      storeAccessToken(_prefs.getString('accessToken').toString());
      storeUser(User.fromJson(jsonDecode(_prefs.getString('user')!)));
    }
  }

  @action
  Future<void> loadUserData() async => await _getUserDataFromSharedPrefs();

  @action
  void _removeUser() => _user.resetUser();

  @action
  void _removeToken() => storeAccessToken('');

  @action
  Future<void> _removeUserDataFromApp() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('accessToken').toString().isNotEmpty) {
      print('Removing user data from prefs..');
      _removeUser();
      _prefs.setString('user', '');
      _removeToken();
      _prefs.setString('accessToken', '');
    }
  }

  @action
  Future<void> logout() async => await _removeUserDataFromApp();
}
