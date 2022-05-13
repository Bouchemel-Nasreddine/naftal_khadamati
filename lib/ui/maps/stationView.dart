import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Standard Bottom Sheet Demo',
      home: Scaffold(
        // Use a Builder to get a context within the Scaffold.
        body: Builder(
          builder: (context) {
            return Center(
              child: TextButton(
                child: Text('SHOW BOTTOM SHEET'),
                onPressed: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
