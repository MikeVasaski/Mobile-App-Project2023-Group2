import 'dart:convert';
import 'package:flutter/material.dart';

import 'location/hueykaew.dart';
import 'location/bigbanyan.dart';
import 'location/doipui.dart';
import 'location/hermitcave.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // MyBox is the method for display info of specific locations
  // name refer to the specific location's name
  // Widget MyBox(String name, String lat, String long, String img_url) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => MapPage(
  //               latitude: double.parse(lat),
  //               longitude: double.parse(long),
  //             ),
  //           ),
  //         );
  //     },
  //     child: Container(
  //         margin: EdgeInsets.only(top: 20),
  //         padding: EdgeInsets.all(20),
  //         height: 120,
  //         decoration: BoxDecoration(
  //             color: Colors.green[100],
  //             borderRadius: BorderRadius.circular(20),
  //             image: DecorationImage(
  //                 image: NetworkImage(img_url),
  //                 fit: BoxFit.cover,
  //                 colorFilter: ColorFilter.mode(
  //                     Colors.black.withOpacity(0.5), BlendMode.darken))),
  //         child: Column(children: [
  //           Text(name,
  //               style: TextStyle(
  //                   fontSize: 18,
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.bold)),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Text('Lat:$lat,Long:$long',
  //               style: TextStyle(
  //                 fontSize: 10,
  //                 color: Colors.white,
  //               )),
  //         ])),
  //   );
  //}

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
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
              child: Column(
            children: [
              Image.asset(
                'assets/hueykaew_1.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('Huey Kaew Waterfall(น้ำตกห้วยแก้ว)'),
                subtitle:
                    Text('Lat: 18.812059957422427, Long: 98.9445457975004'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HueyKaewPage()));
                },
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Card(
              child: Column(
            children: [
              Image.asset(
                'assets/hermitcave_1.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('Hermit Cave(ถ้ำฤาษี)'),
                subtitle:
                    Text('Lat: 18.807027575878315, Long: 98.91068798040921'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HermitCavePage()));
                },
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Card(
              child: Column(
            children: [
              Image.asset(
                'assets/doipui_1.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('Doi Pui (ยอดดอยปุย)'),
                subtitle:
                    Text('Lat: 18.83221904126119, Long: 98.88893299884577'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoipuiPage()));
                },
              ),
            ],
          )),
          Card(
              child: Column(
            children: [
              Image.asset(
                'assets/bigbanyan_1.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('Big Banyan Tree (ต้นไทรใหญ่)'),
                subtitle:
                    Text('Lat: 18.807541151790403, Long: 98.95145751100694'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BigbanyanPage()));
                },
              ),
            ],
          )),
        ],

        // body: Padding(
        //     padding: const EdgeInsets.all(20),
        //     child: FutureBuilder(
        //       builder: (context, snapshot) {
        //         var data = json.decode(snapshot.data.toString());
        //         return ListView.builder(
        //           itemBuilder: (BuildContext context, int index) {
        //             return MyBox(data[index]['name'], data[index]['lat'],
        //                 data[index]['long'], data[index]['img_url']);
        //           },
        //           itemCount: data.length,
        //         );
        //       },
        //       future:
        //           DefaultAssetBundle.of(context).loadString('assets/data.json'),
        //     )),
      ),
    );
  }
}

class HueykaewPage {
}
