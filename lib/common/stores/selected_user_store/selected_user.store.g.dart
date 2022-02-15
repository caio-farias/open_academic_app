// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedUserStore on _SelectedUserStore, Store {
  Computed<UserStoreModel>? _$getUserComputed;

  @override
  UserStoreModel get getUser =>
      (_$getUserComputed ??= Computed<UserStoreModel>(() => super.getUser,
              name: '_SelectedUserStore.getUser'))
          .value;

  final _$_userAtom = Atom(name: '_SelectedUserStore._user');

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

  final _$_SelectedUserStoreActionController =
      ActionController(name: '_SelectedUserStore');

  @override
  void storeUser(User newUser) {
    final _$actionInfo = _$_SelectedUserStoreActionController.startAction(
        name: '_SelectedUserStore.storeUser');
    try {
      return super.storeUser(newUser);
    } finally {
      _$_SelectedUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getUser: ${getUser}
    ''';
  }
}
