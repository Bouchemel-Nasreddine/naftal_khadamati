import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
