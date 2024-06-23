import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hinder/models/user.dart';
import 'package:hinder/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:hinder/main.dart'; // Ensure this import is correct

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _gender = '';
  String _skill = '';
  String _email = '';
  GeoPoint _location = const GeoPoint(0, 0);

  List<String> _skillLevels = ['Beginner', 'Intermediate', 'Advanced'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Gender'),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                  onSaved: (value) {
                    _gender = value!;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Skill Level'),
                  items: _skillLevels
                      .map((skill) => DropdownMenuItem(
                            value: skill,
                            child: Text(skill),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your skill level';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _skill = value!;
                    });
                  },
                  onSaved: (value) {
                    _skill = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _location = const GeoPoint(0, 0);
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save the data to JSON file and post to Firestore database
                      // TODO: Implement the logic here
                      _databaseService.addUser(User(
                        name: _name,
                        gender: _gender,
                        location: _location,
                        skill: _skill,
                        email: _email,
                      ));
                      var appState = context.read<MyAppState>();
                      appState.setSelectedIndex(3);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
