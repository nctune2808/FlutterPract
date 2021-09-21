import 'package:flutter/material.dart';
import 'package:remember_flutter/preferences_service.dart';

import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _selectedGender = Gender.MALE;
  var _selectedNationality = Nationality.ENGLISH;
  var _selectedProgramLanguage = Set<ProgramLanguage>();
  var _isGraduated = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedNationality = settings.nationality;
      _selectedProgramLanguage = settings.programLanguages;
      _isGraduated = settings.isGraduated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
            ),
            RadioListTile(
                title: Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (Gender? newVal) =>
                    setState(() => _selectedGender = newVal!)),
            RadioListTile(
                title: Text('Male'),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (Gender? newVal) =>
                    setState(() => {_selectedGender = newVal!})),
            RadioListTile(
                title: Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (Gender? newVal) =>
                    setState(() => {_selectedGender = newVal!})),
            RadioListTile(
                title: Text('English'),
                value: Nationality.ENGLISH,
                groupValue: _selectedNationality,
                onChanged: (Nationality? newVal) =>
                    setState(() => {_selectedNationality = newVal!})),
            RadioListTile(
                title: Text('Vietnamese'),
                value: Nationality.VIETNAMESE,
                groupValue: _selectedNationality,
                onChanged: (Nationality? newVal) =>
                    setState(() => {_selectedNationality = newVal!})),
            CheckboxListTile(
                title: Text("Java"),
                value: _selectedProgramLanguage.contains(ProgramLanguage.JAVA),
                onChanged: (_) {
                  setState(() {
                    _selectedProgramLanguage.contains(ProgramLanguage.JAVA)
                        ? _selectedProgramLanguage.remove(ProgramLanguage.JAVA)
                        : _selectedProgramLanguage.add(ProgramLanguage.JAVA);
                  });
                }),
            CheckboxListTile(
                title: Text("Swift"),
                value: _selectedProgramLanguage.contains(ProgramLanguage.SWIFT),
                onChanged: (_) {
                  setState(() {
                    _selectedProgramLanguage.contains(ProgramLanguage.SWIFT)
                        ? _selectedProgramLanguage.remove(ProgramLanguage.SWIFT)
                        : _selectedProgramLanguage.add(ProgramLanguage.SWIFT);
                  });
                }),
            CheckboxListTile(
                title: Text("Flutter"),
                value:
                    _selectedProgramLanguage.contains(ProgramLanguage.FLUTTER),
                onChanged: (_) {
                  setState(() {
                    _selectedProgramLanguage.contains(ProgramLanguage.FLUTTER)
                        ? _selectedProgramLanguage
                            .remove(ProgramLanguage.FLUTTER)
                        : _selectedProgramLanguage.add(ProgramLanguage.FLUTTER);
                  });
                }),
            CheckboxListTile(
                title: Text("Python"),
                value:
                    _selectedProgramLanguage.contains(ProgramLanguage.PYTHON),
                onChanged: (_) {
                  setState(() {
                    _selectedProgramLanguage.contains(ProgramLanguage.PYTHON)
                        ? _selectedProgramLanguage
                            .remove(ProgramLanguage.PYTHON)
                        : _selectedProgramLanguage.add(ProgramLanguage.PYTHON);
                  });
                }),
            SwitchListTile(
                title: _isGraduated ? Text("Graduated") : Text("Not Graduated"),
                value: _isGraduated,
                onChanged: (newVal) => setState(() => {_isGraduated = newVal})),
            TextButton(onPressed: _saveSettings, child: Text("Save Settings"))
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        nationality: _selectedNationality,
        programLanguages: _selectedProgramLanguage,
        isGraduated: _isGraduated);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
  }
}
