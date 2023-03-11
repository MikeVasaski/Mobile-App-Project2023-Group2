import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobilpgroup2/pages/home.dart';

class TreemapPage extends StatefulWidget {
  // const HomePage({ Key? key}) : super(key: key);

  @override
  _TreemapPageState createState() => _TreemapPageState();
}

class _TreemapPageState extends State<TreemapPage> {
  static const LatLng hueykaewWater =
      LatLng(18.812059957422427, 98.9445457975004);

  static const LatLng hermitCave =
      LatLng(18.807027575878315, 98.91068798040921);
  static const LatLng doipui = LatLng(18.83221904126119, 98.88893299884577);

  static const LatLng bigBanyanTree =
      LatLng(18.807541151790403, 98.95145751100694);

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
        initialCameraPosition: CameraPosition(target: bigBanyanTree, zoom: 18),
        // markers: Set<Marker>.of(markers),
        // trafficEnabled: true,
        // buildingsEnabled: true,
      ),
    );
  }
}
