// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_first_app/pages/display_page.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Input Text pada Flutter dikenal dengan TextEditingController
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Form'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Please enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Please enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DisplayPage(
                    name: nameCtrl.text,
                    email: emailCtrl.text,
                  ),
                ));
              },
              child: Text('SEND DATA TO NEXT PAGE'),
            ),
          ],
        ),
      ),
    );
  }
}
