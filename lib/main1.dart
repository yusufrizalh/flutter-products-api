// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // inisialisasi nilai/state awal
  int angka = 0; // null safety

  // method untuk mengubah nilai/state awal
  void incrementAngka() {
    setState(() {
      angka++; // angka + 1
    });
  }

  void decrementAngka() {
    setState(() {
      angka--; // angka - 1
    });
  }

  void resetAngka() {
    setState(() {
      angka = 0; // angka 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      title: 'Stateful Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learn Flutter Widget'),
          centerTitle: true,
          // backgroundColor: Colors.greenAccent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(54, 103, 132, 1),
                  Color.fromRGBO(2, 224, 122, 1),
                ],
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              print('Menekan tombol home');
            },
            icon: Icon(Icons.home),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => print('Menekan search'),
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => print('Menekan settings'),
              icon: Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () => print('Menekan photo'),
              icon: Icon(Icons.photo),
            ),
            IconButton(
              onPressed: () => print('Menekan email'),
              icon: Icon(Icons.email),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image(
              //   image: AssetImage('/images/pexels_1.jpg'),
              //   width: 300.0,
              //   height: 300.0,
              // ),
              Image(
                image:
                    NetworkImage('https://i.ibb.co/PxkfQPX/github-avatar.png'),
                width: 100.0,
                height: 100.0,
              ),
              Text(
                'Angka bernilai: ${angka}',
                style: TextStyle(
                  fontSize: 32.0,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
              ),
              ElevatedButton(
                onPressed: incrementAngka,
                child: Text('Increment'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              ),
              ElevatedButton(
                onPressed: decrementAngka,
                child: Text('Decrement'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              ),
              ElevatedButton(
                onPressed: resetAngka,
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
