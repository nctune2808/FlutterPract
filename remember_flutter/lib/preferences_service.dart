import 'package:remember_flutter/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', settings.username);
    await preferences.setBool('isGraduated', settings.isGraduated);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setInt('nationality', settings.nationality.index);
    await preferences.setStringList(
        'programmingLanguages',
        settings.programLanguages
            .map((lang) => lang.index.toString())
            .toList());

    print("Saved setttings");
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isGraduated = preferences.getBool('isGraduated');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final nationality =
        Nationality.values[preferences.getInt('nationality') ?? 0];
    // final programLanguagesIndicies =
    //     preferences.getStringList('programmingLanguages');
    final programLanguages = preferences
        .getStringList('programmingLanguages')
        .map((String stringIndex) =>
            ProgramLanguage.values[int.parse(stringIndex)])
        .toSet();

    return Settings(
      username: username,
      gender: gender,
      nationality: nationality,
      programLanguages: programLanguages,
      isGraduated: isGraduated,
    );
  }
}
