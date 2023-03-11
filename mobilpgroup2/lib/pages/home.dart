import 'dart:convert';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget MyBox(String name, String lat, String long, String img_url) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(img_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken))),
      child: Column(children: [
        Text(name,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20,
        ),
        Text('Lat:$lat,Long:$long',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none, //add notification icon in appbar
              )),
        ],

        backgroundColor: Color.fromARGB(255, 33, 97, 35),

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,));}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Myhomepage(title: 'Appbar'),
    );
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          elevation: 24,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg"),
                    fit: BoxFit.cover)),
          ),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.list_alt),
              text: "Feed",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profit",
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: "Settings",
            ),
          ]),
        ),
        body: Center(),


      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]['name'], data[index]['lat'],
                      data[index]['long'], data[index]['img_url']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }
}
  }