const enumUserSearchFilterOpt = [
  "Perfis",
  "Idiomas",
  "Formações",
  "Experiência"
];

class UserSearchFilterOptions {
  final FilterOptionsField roles =
      (FilterOptionsField(enumUserSearchFilterOpt[0], []));
  final FilterOptionsField languages =
      (FilterOptionsField(enumUserSearchFilterOpt[1], []));
  final FilterOptionsField education =
      (FilterOptionsField(enumUserSearchFilterOpt[2], []));
  final FilterOptionsField expirienceTime =
      (FilterOptionsField(enumUserSearchFilterOpt[3], []));

  Map<String, FilterOptionsField> toMap() {
    return {
      'roles': roles,
      'languages': languages,
      'education': education,
      'expirienceTime': expirienceTime
    };
  }

  bool isEmpty() {
    bool output = true;
    toMap().forEach((key, value) {
      output = output && value.content.isEmpty;
    });
    return output;
  }

  bool contains(String key, String value) {
    return toMap()[key]!.content.contains(value);
  }

  void add(String key, String value) {
    toMap()[key]!.content.add(value);
  }

  void remove(String key, String value) {
    toMap()[key]!.content.remove(value);
  }
}

class FilterOptionsField {
  final String name;
  final List<String> content;

  List<int> get getContentAsInt {
    List<int> output = [];
    for (var element in content) {
      output.add(int.parse(element.toString()));
    }
    return output;
  }

  FilterOptionsField(this.name, this.content);
}
