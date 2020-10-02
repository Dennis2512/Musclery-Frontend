import 'package:flutter/material.dart';
import 'package:trainingstagebuch/screens/analyse.dart';
import 'package:trainingstagebuch/screens/drawer/profile.dart';
import 'package:trainingstagebuch/screens/essen/essen.dart';
import 'package:trainingstagebuch/screens/drawer/settings.dart';
import 'package:trainingstagebuch/screens/drawer/featured.dart';
import 'package:trainingstagebuch/screens/sport.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 1;
  final _auth = AuthService();
  Essen essen = Essen();
  Sport sport = Sport();
  Analyse analyse = Analyse();
  @override
  Widget build(BuildContext context) {
    List content = [essen, sport, analyse];
    return Scaffold(
      appBar: AppBar(
        title: Text("Trainingstagebuch"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Image(
                    image: AssetImage("assets/logo_sport.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text("Einstellungen"),
              leading: Icon(Icons.settings),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings())),
            ),
            Divider(),
            ListTile(
              title: Text("Profil"),
              leading: Icon(Icons.person),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile())),
            ),
            Divider(),
            ListTile(
              title: Text("Featured"),
              leading: Icon(Icons.star),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Featured())),
            ),
            Divider(),
            ListTile(
              title: Text("Abmelden"),
              leading: Icon(Icons.exit_to_app),
              onTap: () => _logout(),
            ),
            Divider()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), title: Text("Essen")),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), title: Text("Sport")),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), title: Text("Analyse"))
        ],
        onTap: (value) => setState(() {
          this._index = value;
        }),
      ),
      body: content[_index],
    );
  }

  void _logout() async {
    await this._auth.signOut();
  }
}
