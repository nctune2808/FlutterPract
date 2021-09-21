enum Gender { FEMALE, MALE, OTHER }

enum Nationality { ENGLISH, VIETNAMESE, OTHER }

enum ProgramLanguage { JAVA, SWIFT, FLUTTER, PYTHON, PHP }

class Settings {
  final String username;
  final Gender gender;
  final Nationality nationality;
  final Set<ProgramLanguage> programLanguages;
  final bool isGraduated;

  Settings(
      {required this.username,
      required this.gender,
      required this.nationality,
      required this.programLanguages,
      required this.isGraduated});
}
