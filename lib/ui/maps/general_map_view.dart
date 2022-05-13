import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
      final Marker marker = Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: const MarkerId('0'),
        position: chosedLocation,
      );

      markerSet[const MarkerId('0')] = marker;
      setState(() {});
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
    );
    markerSet[id] = marker;
  }

  void goToBestLocation() {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: stationLocations[2], zoom: 14.5, tilt: 50.0)));
  }
}
