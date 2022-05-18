// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  late String name, email;

  DisplayPage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _onBackPressed(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Display Page'),
          leading: IconButton(
            onPressed: () {
              _onBackPressed(context);
            },
            icon: Icon(Icons.arrow_circle_left),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Name is ${name}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
              Text('Email is ${email}'),
            ],
          ),
        ),
      ),
    );
  }

  void _onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
