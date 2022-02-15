import 'package:open_academic_app/common/models/user.dart';

class UserStoreModel {
  late Qualifications? _qualifications;
  late List<SocialLinks>? _socialLinks;
  late int? _expirienceTime;
  late int? _productionsCount;
  late num? _grade;
  late String? _email;
  late String? _aboutMe;
  late String? _profilePhoto;
  late List<String>? _favorits;
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
      String? email,
      String? aboutMe,
      String? profilePhoto,
      List<String>? favorits,
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
        _email = email,
        _aboutMe = aboutMe,
        _profilePhoto = profilePhoto,
        _favorits = favorits,
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
  String? get getAboutMe => _aboutMe;
  String? get getEmail => _email;
  String? get getProfilePhoto => _profilePhoto;
  List<String>? get getIsFavorite => _favorits;
  List<String>? get getRoles => _roles;
  String? get getBirthDate => _birthDate;
  String? get getLastName => _lastName;
  String? get getFirstName => _firstName;
  String? get getUserId => _userId;
  int? get getIV => _iV;

  set setAboutMe(String? aboutMe) => _aboutMe = aboutMe;
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
  set setIsFavorite(List<String>? favorits) => _favorits = favorits;
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
      setQualifications = newUser.qualifications;
      setSocialLinks = newUser.socialLinks;
      setExpirienceTime = newUser.expirienceTime;
      setProductionsCount = newUser.productionsCount;
      setGrade = newUser.grade;
      setEmail = newUser.email;
      setAboutMe = newUser.aboutMe;
      setProfilePhoto = newUser.profilePhoto;
      setIsFavorite = newUser.favorits;
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
    setQualifications = null;
    setSocialLinks = null;
    setExpirienceTime = null;
    setProductionsCount = null;
    setGrade = null;
    setEmail = '';
    setAboutMe = '';
    setProfilePhoto = '';
    setIsFavorite = null;
    setRoles = null;
    setBirthDate = '';
    setLastName = '';
    setFirstName = '';
    setUserId = '';
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
    data['email'] = _email;
    data['profilePhoto'] = _profilePhoto;
    data['favorits'] = _favorits;
    data['aboutMe'] = _aboutMe;
    data['roles'] = _roles;
    data['birthDate'] = _birthDate;
    data['lastName'] = _lastName;
    data['firstName'] = _firstName;
    data['userId'] = _userId;
    data['__v'] = _iV;
    return data;
  }
}
