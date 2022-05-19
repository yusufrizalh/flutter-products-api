// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/products_page.dart';
import 'package:flutter_first_app/pages/search_page.dart';
import 'package:flutter_first_app/pages/settings_page.dart';

void main() {
  runApp(MySliverApp());
}

class MySliverApp extends StatelessWidget {
  const MySliverApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard',
      home: SliverAppbarWidget(),
    );
  }
}

class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            drawerHeader(),
            Divider(),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.home, color: Colors.white),
              onTap: () => print('Menu Home'),
            ),
            ListTile(
              title: Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.photo, color: Colors.white),
              onTap: () => print('Menu Gallery'),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.calendar_today, color: Colors.white),
              onTap: () => print('Menu About'),
            ),
            ListTile(
              title: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.contact_mail, color: Colors.white),
              onTap: () => print('Menu Contact'),
            ),
            ListTile(
              title: Text(
                'Products',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.shop, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsPage(),
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              snap: true,
              pinned: true,
              leading: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    );
                    Navigator.push(context, route);
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    // 1. Menentukan route
                    Route route = MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    );
                    // 2. Membuat navigasi
                    Navigator.push(context, route);
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
              backgroundColor: Colors.red,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'My Dashboard',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                background: Image(
                  image: AssetImage('/images/pexels_1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dashboard Page'),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/nav_drawer_header_background.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 190.0,
            bottom: 72.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 34,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/pexels_2.jpeg'),
              ),
            ),
          ),
          Positioned(
            bottom: 32.0,
            left: 16.0,
            child: Text(
              'Custom Header Nav Drawer',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
