// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on _FilterStore, Store {
  Computed<UserSearchFilterOptions>? _$getSearchFilterComputed;

  @override
  UserSearchFilterOptions get getSearchFilter => (_$getSearchFilterComputed ??=
          Computed<UserSearchFilterOptions>(() => super.getSearchFilter,
              name: '_FilterStore.getSearchFilter'))
      .value;
  Computed<bool>? _$getIsEmptyComputed;

  @override
  bool get getIsEmpty =>
      (_$getIsEmptyComputed ??= Computed<bool>(() => super.getIsEmpty,
              name: '_FilterStore.getIsEmpty'))
          .value;

  final _$_userSearchFilterOptionsAtom =
      Atom(name: '_FilterStore._userSearchFilterOptions');

  @override
  UserSearchFilterOptions get _userSearchFilterOptions {
    _$_userSearchFilterOptionsAtom.reportRead();
    return super._userSearchFilterOptions;
  }

  @override
  set _userSearchFilterOptions(UserSearchFilterOptions value) {
    _$_userSearchFilterOptionsAtom
        .reportWrite(value, super._userSearchFilterOptions, () {
      super._userSearchFilterOptions = value;
    });
  }

  final _$_isEmptyAtom = Atom(name: '_FilterStore._isEmpty');

  @override
  bool get _isEmpty {
    _$_isEmptyAtom.reportRead();
    return super._isEmpty;
  }

  @override
  set _isEmpty(bool value) {
    _$_isEmptyAtom.reportWrite(value, super._isEmpty, () {
      super._isEmpty = value;
    });
  }

  final _$_FilterStoreActionController = ActionController(name: '_FilterStore');

  @override
  bool setIsEmpty() {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setIsEmpty');
    try {
      return super.setIsEmpty();
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(String key, String value) {
    final _$actionInfo =
        _$_FilterStoreActionController.startAction(name: '_FilterStore.add');
    try {
      return super.add(key, value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool contains(String key, String value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.contains');
    try {
      return super.contains(key, value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(String key, String value) {
    final _$actionInfo =
        _$_FilterStoreActionController.startAction(name: '_FilterStore.remove');
    try {
      return super.remove(key, value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getSearchFilter: ${getSearchFilter},
getIsEmpty: ${getIsEmpty}
    ''';
  }
}
