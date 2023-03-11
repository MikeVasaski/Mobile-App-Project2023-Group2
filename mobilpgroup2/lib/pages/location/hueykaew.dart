import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HueyKaewPage extends StatefulWidget {
  // const HomePage({ Key? key}) : super(key: key);

  @override
  _HueyKaewPageState createState() => _HueyKaewPageState();
}

class _HueyKaewPageState extends State<HueyKaewPage> {
 CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  List<Marker> _marker = <Marker>[];
  List<LatLng> _latlng = [
    LatLng(18.811883035743637, 98.94444592518029),
    LatLng(18.8117867615627, 98.94448224914547),
    LatLng(18.812041200349825, 98.94461664781667),
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
                                    image: AssetImage('assets/hueykaew_2.jpg'),
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
                                    'Wild fig trees',
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
                                'These are large, deciduous trees that produce edible figs. They are an important food source for wildlife in the area around the waterfall.',
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
        title: Text("Huey Kaew waterfall"),
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
                target: LatLng(18.812059957422427, 98.9445457975004), zoom: 16),
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


