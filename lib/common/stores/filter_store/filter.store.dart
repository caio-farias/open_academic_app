// ignore_for_file: prefer_final_fields

import 'package:mobx/mobx.dart';
import 'package:open_academic_app/common/models/search_filter_options.dart';

part 'filter.store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  @observable
  UserSearchFilterOptions _userSearchFilterOptions = UserSearchFilterOptions();

  @observable
  bool _isEmpty = true;

  @computed
  UserSearchFilterOptions get getSearchFilter => _userSearchFilterOptions;

  @computed
  bool get getIsEmpty => _isEmpty;

  @action
  bool setIsEmpty() => _userSearchFilterOptions.isEmpty();

  @action
  void add(String key, String value) {
    _userSearchFilterOptions.add(key, value);
    _isEmpty = false;
  }

  @action
  bool contains(String key, String value) =>
      _userSearchFilterOptions.contains(key, value);

  @action
  void remove(String key, String value) {
    _userSearchFilterOptions.remove(key, value);
    _isEmpty = setIsEmpty();
  }
}
