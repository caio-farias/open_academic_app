// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<UserStoreModel>? _$getUserComputed;

  @override
  UserStoreModel get getUser =>
      (_$getUserComputed ??= Computed<UserStoreModel>(() => super.getUser,
              name: '_UserStore.getUser'))
          .value;
  Computed<String>? _$getAccessTokenComputed;

  @override
  String get getAccessToken =>
      (_$getAccessTokenComputed ??= Computed<String>(() => super.getAccessToken,
              name: '_UserStore.getAccessToken'))
          .value;
  Computed<bool>? _$getIsUserAuthenticatedComputed;

  @override
  bool get getIsUserAuthenticated => (_$getIsUserAuthenticatedComputed ??=
          Computed<bool>(() => super.getIsUserAuthenticated,
              name: '_UserStore.getIsUserAuthenticated'))
      .value;

  final _$_userAtom = Atom(name: '_UserStore._user');

  @override
  UserStoreModel get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(UserStoreModel value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$_accessTokenAtom = Atom(name: '_UserStore._accessToken');

  @override
  String get _accessToken {
    _$_accessTokenAtom.reportRead();
    return super._accessToken;
  }

  @override
  set _accessToken(String value) {
    _$_accessTokenAtom.reportWrite(value, super._accessToken, () {
      super._accessToken = value;
    });
  }

  final _$_persistUserDataAsyncAction =
      AsyncAction('_UserStore._persistUserData');

  @override
  Future<void> _persistUserData() {
    return _$_persistUserDataAsyncAction.run(() => super._persistUserData());
  }

  final _$loadUserDataAsyncAction = AsyncAction('_UserStore.loadUserData');

  @override
  Future<void> loadUserData() {
    return _$loadUserDataAsyncAction.run(() => super.loadUserData());
  }

  final _$_getUserDataFromSharedPrefsAsyncAction =
      AsyncAction('_UserStore._getUserDataFromSharedPrefs');

  @override
  Future<void> _getUserDataFromSharedPrefs() {
    return _$_getUserDataFromSharedPrefsAsyncAction
        .run(() => super._getUserDataFromSharedPrefs());
  }

  final _$logoutAsyncAction = AsyncAction('_UserStore.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_removeUserDataFromAppAsyncAction =
      AsyncAction('_UserStore._removeUserDataFromApp');

  @override
  Future<void> _removeUserDataFromApp() {
    return _$_removeUserDataFromAppAsyncAction
        .run(() => super._removeUserDataFromApp());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void storeUser(User newUser) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.storeUser');
    try {
      return super.storeUser(newUser);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void storeAccesstoken(String newToken) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.storeAccesstoken');
    try {
      return super.storeAccesstoken(newToken);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _removeUser() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore._removeUser');
    try {
      return super._removeUser();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getUser: ${getUser},
getAccessToken: ${getAccessToken},
getIsUserAuthenticated: ${getIsUserAuthenticated}
    ''';
  }
}
