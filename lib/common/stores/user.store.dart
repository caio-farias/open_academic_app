// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user.dart';
part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
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
    _persistUserData();
  }

  @action
  void storeAccesstoken(String newToken) {
    _accessToken = newToken;
    _persistUserData();
  }

  @action
  Future<void> _persistUserData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    print('PERSISTINDO NO PREFS....');
    _prefs.setString('accessToken', _accessToken);
    _prefs.setString('user', jsonEncode(_user.toJson()));
  }

  @action
  Future<void> loadUserData() async => await _getUserDataFromSharedPrefs();

  @action
  Future<void> _getUserDataFromSharedPrefs() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('accessToken').toString().isNotEmpty) {
      // print('CARREGANDO PREFS....');
      // storeAccesstoken(_prefs.getString('accessToken')!);
      // storeUser(User.fromJson(jsonDecode(_prefs.getString('user')!)));
      // print(_user);
    }
  }

  @action
  Future<void> logout() async => await _removeUserDataFromApp();

  @action
  void _removeUser() => _user.resetUser();

  @action
  Future<void> _removeUserDataFromApp() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('accessToken').toString().isNotEmpty) {
      print('REMOVENDO DADOS....');
      _prefs.setString('accessToken', '');
      _prefs.setString('user', '');
      _removeUser();
    }
  }
}
