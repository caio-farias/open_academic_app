import 'package:open_academic_app/common/models/user.dart';

class UserStoreModel {
  late Qualifications? _qualifications;
  late List<SocialLinks>? _socialLinks;
  late int? _expirienceTime;
  late int? _productionsCount;
  late num? _grade;
  late String? _password;
  late String? _email;
  late String? _profilePhoto;
  late List<String>? _isFavorite;
  late List<String>? _roles;
  late String? _birthDate;
  late String? _lastName;
  late String? _firstName;
  late String? _userId;
  late int? _iV;

  UserStoreModel(
      {Qualifications? qualifications,
      List<SocialLinks>? socialLinks,
      int? expirienceTime,
      int? productionsCount,
      num? grade,
      String? password,
      String? email,
      String? profilePhoto,
      List<String>? isFavorite,
      List<String>? roles,
      String? birthDate,
      String? lastName,
      String? firstName,
      String? userId,
      int? iV})
      : _qualifications = qualifications,
        _socialLinks = socialLinks,
        _expirienceTime = expirienceTime,
        _productionsCount = productionsCount,
        _grade = grade,
        _password = password,
        _email = email,
        _profilePhoto = profilePhoto,
        _isFavorite = isFavorite,
        _roles = roles,
        _birthDate = birthDate,
        _lastName = lastName,
        _firstName = firstName,
        _userId = userId,
        _iV = iV;

  Qualifications? get getQualifications => _qualifications;
  List<SocialLinks>? get getSocialLinks => _socialLinks;
  int? get getExpirienceTime => _expirienceTime;
  int? get getProductionsCount => _productionsCount;
  num? get getGrade => _grade;
  String? get getPassword => _password;
  String? get getEmail => _email;
  String? get getProfilePhoto => _profilePhoto;
  List<String>? get getIsFavorite => _isFavorite;
  List<String>? get getRoles => _roles;
  String? get getBirthDate => _birthDate;
  String? get getLastName => _lastName;
  String? get getFirstName => _firstName;
  String? get getUserId => _userId;
  int? get getIV => _iV;

  set setPassword(String? password) => _password = password;
  set setQualifications(Qualifications? qualifications) =>
      _qualifications = qualifications;
  set setSocialLinks(List<SocialLinks>? socialLinks) =>
      _socialLinks = socialLinks;
  set setExpirienceTime(int? expirienceTime) =>
      _expirienceTime = expirienceTime;
  set setProductionsCount(int? productionsCount) =>
      _productionsCount = productionsCount;
  set setGrade(num? grade) => _grade = grade;
  set setEmail(String? email) => _email = email;

  set setProfilePhoto(String? profilePhoto) => _profilePhoto = profilePhoto;
  set setIsFavorite(List<String>? isFavorite) => _isFavorite = isFavorite;
  set setRoles(List<String>? roles) => _roles = roles;
  set setBirthDate(String? birthDate) => _birthDate = birthDate;
  set setLastName(String? lastName) => _lastName = lastName;
  set setFirstName(String? firstName) => _firstName = firstName;
  set setUserId(String? userId) => _userId = userId;
  set setIV(int? iV) {
    _iV = iV;
  }

  set setNewUser(User newUser) {
    try {
      setPassword = newUser.password;
      setQualifications = newUser.qualifications;
      setSocialLinks = newUser.socialLinks;
      setExpirienceTime = newUser.expirienceTime;
      setProductionsCount = newUser.productionsCount;
      setGrade = newUser.grade;
      setEmail = newUser.email;
      setProfilePhoto = newUser.profilePhoto;
      setIsFavorite = newUser.isFavorite;
      setRoles = newUser.roles;
      setBirthDate = newUser.birthDate;
      setLastName = newUser.lastName;
      setFirstName = newUser.firstName;
      setUserId = newUser.userId;
      setIV = newUser.iV;
    } catch (e) {
      rethrow;
    }
  }

  void resetUser() {
    setPassword = null;
    setQualifications = null;
    setSocialLinks = null;
    setExpirienceTime = null;
    setProductionsCount = null;
    setGrade = null;
    setEmail = null;
    setProfilePhoto = null;
    setIsFavorite = null;
    setRoles = null;
    setBirthDate = null;
    setLastName = null;
    setFirstName = null;
    setUserId = null;
    setIV = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_qualifications != null) {
      data['qualifications'] = _qualifications!.toJson();
    }
    if (_socialLinks != null) {
      data['socialLinks'] = _socialLinks!.map((v) => v.toJson()).toList();
    }
    data['expirienceTime'] = _expirienceTime;
    data['productionsCount'] = _productionsCount;
    data['grade'] = _grade;
    data['password'] = _password;
    data['email'] = _email;
    data['profilePhoto'] = _profilePhoto;
    data['isFavorite'] = _isFavorite;
    data['roles'] = _roles;
    data['birthDate'] = _birthDate;
    data['lastName'] = _lastName;
    data['firstName'] = _firstName;
    data['userId'] = _userId;
    data['__v'] = _iV;
    return data;
  }
}
