import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khadamti/ui/maps/stationView.dart';
import 'package:location/location.dart';

import '../components/colored_container.dart';

class GeneraleMap extends StatefulWidget {
  const GeneraleMap({Key? key}) : super(key: key);

  @override
  State<GeneraleMap> createState() => _GeneraleMapState();
}

class _GeneraleMapState extends State<GeneraleMap> {
  late BitmapDescriptor icon;
  late BitmapDescriptor iconRed;
  late BitmapDescriptor iconYellow;
  late BitmapDescriptor iconGreen;
  late GoogleMapController _mapController;
  LatLng chosedLocation = const LatLng(0, 0);
  var markerSet = <MarkerId, Marker>{};
  final stationLocations = [
    LatLng(
      36.7559167480048,
      3.2242709934766443,
    ),
    LatLng(
      36.743265886401566,
      3.18631274195444,
    ),
    LatLng(
      36.7682893125738,
      3.2499038916800704,
    ),
  ];

  void onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    addStationToMaps(MarkerId('1'), stationLocations[0],
        await customMarker('assets/marker_red.png'));
    addStationToMaps(MarkerId('2'), stationLocations[1],
        await customMarker('assets/marker_yellow.png'));
    addStationToMaps(MarkerId('3'), stationLocations[2],
        await customMarker('assets/marker_green.png'));
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          markers: Set<Marker>.of(markerSet.values),
          onTap: onMapTapped,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: const CameraPosition(
            target: LatLng(
              0.0,
              0.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: size.height * 0.02,
          ),
          child: FloatingActionButton.extended(
            onPressed: goToBestLocation,
            label: Text(
              'Best station',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            icon: SvgPicture.asset(
              "assets/direction.svg",
              color: Colors.white,
              height: size.height * 0.04,
              width: size.height * 0.04,
            ),
          ),
        )
      ],
    );
  }

  Future<BitmapDescriptor> customMarker(String markerPath) async {
    ByteData bytes = await rootBundle.load(markerPath);
    final Uint8List list = bytes.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(list);
  }

  onMapTapped(LatLng cordinates) {
    final Marker marker = Marker(
      icon: BitmapDescriptor.defaultMarker,
      markerId: const MarkerId('0'),
      position: cordinates,
    );
    markerSet[const MarkerId('0')] = marker;
    chosedLocation = cordinates;
    setState(() {});
  }

  getLocation() async {
    Location loc = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await loc.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await loc.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await loc.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await loc.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await loc.getLocation();
    if (_locationData.latitude != null && _locationData.longitude != null) {
      chosedLocation =
          LatLng(_locationData.latitude!, _locationData.longitude!);

      _mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: chosedLocation, zoom: 14.5, tilt: 50.0)));
    }
  }

  addStationToMaps(
    MarkerId id,
    LatLng coordinates,
    BitmapDescriptor icon,
  ) {
    final Marker marker = Marker(
      icon: icon,
      markerId: id,
      position: coordinates,
      onTap: showBottomSheet,
    );
    markerSet[id] = marker;
    setState(() {});
  }

  void goToBestLocation() {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: stationLocations[2], zoom: 14.5, tilt: 50.0)));
  }

  showBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        // Using Wrap makes the bottom sheet height the height of the content.
        // Otherwise, the height will be half the height of the screen.
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                'assets/line.svg',
                width: 50,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                  leading: SvgPicture.asset(
                    'assets/station.svg',
                  ),
                  // leading: Image.asset('assets/station.png'),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Station service pva chark",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0)),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Color(0xFFC4C4C4),
                          ),
                          Text("Hai Kahouadji Hamoud Dar El Beida",
                              style: TextStyle(
                                  color: Color(0xFFC4C4C4),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0)),
                        ],
                      )
                    ],
                  )),
              ListTile(
                horizontalTitleGap: 0.0,
                leading: SvgPicture.asset(
                  'assets/direction.svg',
                  height: 26,
                  width: 26,
                ),
                title: Row(
                  children: [
                    Text('3.48 Km de vous',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0)),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                      width: 80,
                      height: 26,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfF3CE06A)),
                        color: Color(0xfF3CE06A).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "available",
                          style: TextStyle(
                            color: Color(0xFF3CE06A),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ColoredContainer(
                    text: "Details",
                    svg: 'assets/Frame.svg',
                    textColor: Color(0xfF6393F2),
                  ),
                  ColoredContainer(
                    text: "Navigate",
                    svg: 'assets/row.svg',
                    textColor: Colors.white,
                    color: Color(0xfF6393F2),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
