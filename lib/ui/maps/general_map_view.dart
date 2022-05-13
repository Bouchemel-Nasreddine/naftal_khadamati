import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeneraleMap extends StatefulWidget {
  const GeneraleMap({Key? key}) : super(key: key);

  @override
  State<GeneraleMap> createState() => _GeneraleMapState();
}

class _GeneraleMapState extends State<GeneraleMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          0.0,
          0.0,
        ),
      ),
    );
  }
}
