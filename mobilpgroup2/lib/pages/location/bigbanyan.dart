import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class BigbanyanPage extends StatefulWidget {
  // const HomePage({ Key? key}) : super(key: key);

  @override
  _BigbanyanPageState createState() => _BigbanyanPageState();
}

class _BigbanyanPageState extends State<BigbanyanPage> {
 CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  List<Marker> _marker = <Marker>[];
  List<LatLng> _latlng = [
    LatLng(18.807703780277226, 98.95167720624883),
    LatLng(18.80772100373997, 98.95125568950954),
    LatLng(18.80802520655296, 98.95033633633071),
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
                                    image: AssetImage('assets/bigbanyan_2.jpg'),
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
                                    'Golden Trumpet Trees',
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
                                'These trees are known for their trumpet-shaped yellow flowers, which bloom in the fall and winter. They are commonly found throughout Chiang Mai University and are a popular sight among visitors and students alike.',
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
        title: Text("Big Banyan"),
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
                target: LatLng(18.807541151790403, 98.95145751100694), zoom: 16),
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


