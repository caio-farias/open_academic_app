class User {
  late Qualifications? qualifications;
  late List<SocialLinks>? socialLinks;
  late int? expirienceTime;
  late int? productionsCount;
  late num? grade;
  late String? email;
  late String? profilePhoto;
  late List<String>? favorits;
  late List<String>? roles;
  late String? aboutMe;
  late String? birthDate;
  late String? lastName;
  late String? firstName;
  late String? userId;
  late int? iV;

  User(
      {this.qualifications,
      this.socialLinks,
      this.expirienceTime,
      this.productionsCount,
      this.grade,
      this.email,
      this.profilePhoto,
      this.favorits,
      this.roles,
      this.birthDate,
      this.lastName,
      this.firstName,
      this.userId,
      this.iV});

  List<Degree> getGradDegrees(int index) {
    return qualifications!.education!.gradDegrees!;
  }

  Degree getGradDegree(int index) {
    return qualifications!.education!.gradDegrees!.elementAt(index);
  }

  List<Degree> getMasterDegrees(int index) {
    return qualifications!.education!.gradDegrees!;
  }

  Degree getMasterDegree(int index) {
    return qualifications!.education!.masterDegrees!.elementAt(index);
  }

  List<Degree> getPhdDegrees(int index) {
    return qualifications!.education!.gradDegrees!;
  }

  Degree getPhdDegree(int index) {
    return qualifications!.education!.phdDegrees!.elementAt(index);
  }

  List<Specializations> getSpecializationsDegrees(int index) {
    return qualifications!.education!.specializations!;
  }

  Specializations getEspecialization(int index) {
    return qualifications!.education!.specializations!.elementAt(index);
  }

  List<Interests> getInterests() {
    return qualifications!.interests!;
  }

  Interests getInterest(int index) {
    return qualifications!.interests!.elementAt(index);
  }

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
    aboutMe = json['aboutMe'];
    favorits = json['favorits'].cast<String>();
    grade = json['grade'];
    expirienceTime = json['expirienceTime'];
    productionsCount = json['productionsCount'];
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
    data['aboutMe'] = aboutMe;
    data['expirienceTime'] = expirienceTime;
    data['productionsCount'] = productionsCount;
    data['grade'] = grade;
    data['email'] = email;
    data['profilePhoto'] = profilePhoto;
    data['favorits'] = favorits;
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
      education = Education.fromJson(json['education']);
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
  List<Degree>? gradDegrees = [];
  List<Degree>? masterDegrees = [];
  List<Degree>? phdDegrees = [];
  List<Specializations>? specializations = [];

  Education(
      {this.gradDegrees,
      this.masterDegrees,
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
        masterDegrees = <Degree>[];
        json['masterDegrees'].forEach((v) {
          masterDegrees!.add(Degree.fromJson(v));
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
      data['masterDegrees'] = masterDegrees!.map((v) => v.toJson()).toList();
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
