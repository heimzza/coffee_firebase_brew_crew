import 'package:brew_crew_firebase/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Update your brew settings",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration,
            validator: (value) => value.isEmpty ? "Please enter a name" : null,
            onChanged: (value) {
              setState(() {
                _currentName = value;
              });
            },
          ),
          SizedBox(height: 20),
          // dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? "0",
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),
            onChanged: (val) { setState(() {
              _currentSugars = val;
            });},
          ),
          // slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (value) {
              setState(() {
                _currentStrength = value.round();
              });
            },
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              "Update",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
            },
          )
        ],
      ),
    );
  }
}
