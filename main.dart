import 'package:flutter/material.dart';
import 'package:plant/other.dart';
import './home.dart';
import './testHardware.dart';
import './managePlants.dart';
import './other.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PlantAppTM",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage2(),
    PlantList(),
    TestHardware(),
    OthersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:_pageOptions[_selectedPage],

      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() { 
            _selectedPage = index;
          });

        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.green,
        items:[

          new BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            title: new Text('Home'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.local_florist),
            title: new Text('My Plants'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.build),
            title: new Text('Test'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.help),
            title: new Text('Help'),
          )
        ],

      ),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  HomePageState createState () => HomePageState();
}
