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
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      // Using Wrap makes the bottom sheet height the height of the content.
                      // Otherwise, the height will be half the height of the screen.
                      return Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
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
                                        Text(
                                            "Hai Kahouadji Hamoud Dar El Beida",
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
                                      border:
                                          Border.all(color: Color(0xfF3CE06A)),
                                      color:
                                          Color(0xfF3CE06A).withOpacity(0.12),
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
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ColoredContainer extends StatelessWidget {
  var color;
  var text;
  var svg;
  var textColor;
  ColoredContainer({
    Key? key,
    this.text = "",
    this.color,
    this.svg,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xfF6393F2)),
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                svg,
                width: 14,
                height: 14,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
