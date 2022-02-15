import 'package:mobx/mobx.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/stores/models/user.dart';
part 'selected_user.store.g.dart';

class SelectedUserStore = _SelectedUserStore with _$SelectedUserStore;

abstract class _SelectedUserStore with Store {
  @observable

  // ignore: prefer_final_fields
  UserStoreModel _user = UserStoreModel();

  @computed
  UserStoreModel get getUser => _user;

  @action
  void storeUser(User newUser) {
    _user.setNewUser = newUser;
  }
}
