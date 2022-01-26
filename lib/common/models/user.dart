class User {
  Qualifications? qualifications;
  List<SocialLinks>? socialLinks;
  int? expirienceTime;
  int? productionsCount;
  num? grade;
  String? password;
  String? email;
  String? profilePhoto;
  List<String>? isFavorite;
  List<String>? roles;
  String? birthDate;
  String? lastName;
  String? firstName;
  String? userId;
  int? iV;

  User(
      {this.qualifications,
      this.socialLinks,
      this.expirienceTime,
      this.productionsCount,
      this.grade,
      this.password,
      this.email,
      this.profilePhoto,
      this.isFavorite,
      this.roles,
      this.birthDate,
      this.lastName,
      this.firstName,
      this.userId,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    qualifications = json['qualifications'] != null
        ? Qualifications.fromJson(json['qualifications'])
        : null;
    if (json['socialLinks'] != null) {
      socialLinks = <SocialLinks>[];
      json['socialLinks'].forEach((v) {
        socialLinks!.add(SocialLinks.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'].cast<String>();
    grade = json['grade'];
    expirienceTime = json['expirienceTime'];
    productionsCount = json['productionsCount'];
    password = json['password'];
    email = json['email'];
    profilePhoto = json['profilePhoto'];
    roles = json['roles'].cast<String>();
    birthDate = json['birthDate'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    userId = json['userId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (qualifications != null) {
      data['qualifications'] = qualifications!.toJson();
    }
    if (socialLinks != null) {
      data['socialLinks'] = socialLinks!.map((v) => v.toJson()).toList();
    }
    data['expirienceTime'] = expirienceTime;
    data['productionsCount'] = productionsCount;
    data['grade'] = grade;
    data['password'] = password;
    data['email'] = email;
    data['profilePhoto'] = profilePhoto;
    data['isFavorite'] = isFavorite;
    data['roles'] = roles;
    data['birthDate'] = birthDate;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['userId'] = userId;
    data['__v'] = iV;
    return data;
  }
}

class Qualifications {
  late List<String>? languages;
  late List<Interests>? interests;
  late Education? education;

  Qualifications({this.languages, this.interests, this.education});

  Qualifications.fromJson(Map<String, dynamic> json) {
    if (json['languages'] != null) languages = json['languages'].cast<String>();
    if (json['interests'] != null) {
      interests = <Interests>[];
      json['interests'].forEach((v) {
        interests!.add(Interests.fromJson(v));
      });
    }
    if (json['education'] != null) {
      if (json['education'].isNotEmpty) {
        education = Education.fromJson(json['education']);
      }
    } else {
      education = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['languages'] = languages;
    if (interests != null) {
      data['interests'] = interests!.map((v) => v.toJson()).toList();
    }
    if (education != null) {
      data['education'] = education!.toJson();
    }
    return data;
  }
}

class Interests {
  late String? subject;
  late String? description;

  Interests({this.subject, this.description});

  Interests.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['description'] = description;
    return data;
  }
}

class Education {
  late List<Degree>? gradDegrees;
  late List<Degree>? masterDegress;
  late List<Degree>? phdDegrees;
  late List<Specializations>? specializations;

  Education(
      {this.gradDegrees,
      this.masterDegress,
      this.phdDegrees,
      this.specializations});

  Education.fromJson(Map<String, dynamic> json) {
    try {
      if (json['gradDegrees'] != null) {
        gradDegrees = <Degree>[];
        json['gradDegrees'].forEach((v) {
          gradDegrees!.add(Degree.fromJson(v));
        });
      }
      if (json['masterDegrees'] != null) {
        masterDegress = <Degree>[];
        json['masterDegrees'].forEach((v) {
          masterDegress!.add(Degree.fromJson(v));
        });
      }
      if (json['phdDegrees'] != null) {
        phdDegrees = <Degree>[];
        json['phdDegrees'].forEach((v) {
          phdDegrees!.add(Degree.fromJson(v));
        });
      }
      if (json['specializations'] != null) {
        specializations = <Specializations>[];
        json['specializations'].forEach((v) {
          specializations!.add(Specializations.fromJson(v));
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gradDegrees!.isNotEmpty) {
      data['gradDegrees'] = gradDegrees!.map((v) => v.toJson()).toList();
    }
    if (gradDegrees!.isNotEmpty) {
      data['masterDegress'] = masterDegress!.map((v) => v.toJson()).toList();
    }
    if (gradDegrees!.isNotEmpty) {
      data['phdDegrees'] = phdDegrees!.map((v) => v.toJson()).toList();
    }
    if (gradDegrees!.isNotEmpty) {
      data['specializations'] =
          specializations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Degree {
  late String? degreeSubject;
  late String? university;
  late List<String>? duration;

  Degree({this.degreeSubject, this.university, this.duration});

  Degree.fromJson(Map<String, dynamic> json) {
    if (json['degreeSubject'] != null) degreeSubject = json['degreeSubject'];
    if (json['university'] != null) university = json['university'];
    if (json['duration'] != null) duration = json['duration'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['degreeSubject'] = degreeSubject;
    data['university'] = university;
    data['duration'] = duration;
    return data;
  }
}

class Specializations {
  late String? subject;
  late String? institution;
  late List<String>? duration;

  Specializations({this.subject, this.institution, this.duration});

  Specializations.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    institution = json['institution'];
    duration = json['duration'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['institution'] = institution;
    data['duration'] = duration;
    return data;
  }
}

class SocialLinks {
  late String? socialNetwork;
  late String? link;

  SocialLinks({this.socialNetwork, this.link});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    socialNetwork = json['socialNetwork'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['socialNetwork'] = socialNetwork;
    data['link'] = link;
    return data;
  }
}
