import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobilpgroup2/pages/home.dart';

class TreemapPage extends StatefulWidget {
  // const HomePage({ Key? key}) : super(key: key);

  @override
  _TreemapPageState createState() => _TreemapPageState();
}

class _TreemapPageState extends State<TreemapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Page"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none, //add notification icon in appbar
              )),
        ],
        backgroundColor: Color.fromARGB(255, 33, 97, 35),
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(18.812059957422427, 98.9445457975004), zoom: 18),
            // markers: Set<Marker>.of(markers),
        // trafficEnabled: true,
        // buildingsEnabled: true,
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class TreesPage extends StatefulWidget {
//   const TreesPage({Key? key}) : super(key: key);

//   @override
//   _TressPageState createState() => _TreesPageState();
// }

// class _TressPageState extends State<TreesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

