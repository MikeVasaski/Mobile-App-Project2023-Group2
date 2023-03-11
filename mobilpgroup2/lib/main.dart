import 'package:flutter/material.dart';
import 'package:mobilpgroup2/pages/contact.dart';
import 'package:mobilpgroup2/pages/home.dart';
import 'package:mobilpgroup2/pages/treesmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TreemapPage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.notifications_none, //add notification icon in appbar
      //         )),
      //   ],
      //   backgroundColor: Color.fromARGB(255, 33, 97, 35),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar( //add Buttomnavigationbar in main.dart for use it in every page
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Color.fromARGB(255, 33, 97, 35), // <-- This works for fixed
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Homepage"),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), label: "Tree Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), label: "Contact"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //Set for link page 
      ),
    );
  }
}

