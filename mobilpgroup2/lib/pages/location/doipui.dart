import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoipuiPage extends StatefulWidget {
  // const HomePage({ Key? key}) : super(key: key);

  @override
  _DoipuiPageState createState() => _DoipuiPageState();
}

class _DoipuiPageState extends State<DoipuiPage> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  List<Marker> _marker = <Marker>[];
  List<LatLng> _latlng = [
    LatLng(18.831721416057718, 98.88838582651917),
    LatLng(18.83203620615321, 98.88858967438215),
    LatLng(18.83211744221113, 98.88818197865618),
    LatLng(18.8322189872283, 98.88917976030129),
  ];
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() {
    for (int i = 0; i < _latlng.length; i++) {
        _marker.add(
          Marker(
              markerId: MarkerId(i.toString()),
              icon: BitmapDescriptor.defaultMarker,
              position: _latlng[i],
              onTap: () {
                _customInfoWindowController.addInfoWindow!(
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/doipui_2.jpg'),
                                    fit: BoxFit.fitWidth,
                                    filterQuality: FilterQuality.high),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Colors.green),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Bamboo trees',
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ),
                                const Spacer(),
                                Text('5 m.'),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Text(
                                'Bamboo is a fast-growing, woody grass that is found throughout Doi Pui. It is used for a variety of purposes, including construction, food, and crafts.',
                                maxLines: 2,
                              )),
                        ],
                      ),
                    ),
                    _latlng[i]);
              }),
        );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doi Pui"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none, //add notification icon in appbar
              )),
        ],
        backgroundColor: Color.fromARGB(255, 33, 97, 35),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(18.83221904126119, 98.88893299884577), zoom: 16),
            markers: Set<Marker>.of(_marker),
            onTap: (postition) {
              _customInfoWindowController.hideInfoWindow!();
            },

            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            // trafficEnabled: true,
            // buildingsEnabled: true,
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          )
        ],
      ),
    );
  }
}
