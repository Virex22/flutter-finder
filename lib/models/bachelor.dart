enum Gender {
  male,
  female,
  other,
}

class Bachelor {
  final String firstname;
  final String lastname;
  final Gender gender;
  final String avatar;
  final List<Gender> searchFor;
  String? job;
  String? description;

  Bachelor({
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.avatar,
    required this.searchFor,
    this.job,
    this.description,
  });
}
