import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khadamti/ui/profile/Historique.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff002866),
      padding: EdgeInsets.only(top: size.height * 0.15),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: size.height * 0.075,
            child: Container(
              height: size.height * 0.825,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.height * 0.03),
                  topRight: Radius.circular(size.height * 0.03),
                ),
              ),
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.07,
                        right: size.width * 0.07,
                      ),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.02),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: size.width * 0.07,
                            right: size.width * 0.07,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/person.svg",
                                    height: size.height * 0.025,
                                    color: Color(0xff6393F2),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Editer les info du profile',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: size.height * 0.025,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff6393F2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.07,
                        right: size.width * 0.07,
                      ),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.02),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: size.width * 0.07,
                            right: size.width * 0.07,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/world.svg",
                                    height: size.height * 0.025,
                                    color: Color(0xff6393F2),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Langue',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: size.height * 0.025,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff6393F2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.07,
                        right: size.width * 0.07,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Historique(),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.height * 0.02),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: size.width * 0.07,
                              right: size.width * 0.07,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/watch.svg",
                                      height: size.height * 0.025,
                                      color: Color(0xff6393F2),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Text(
                                      'Historique des factures',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: size.height * 0.025,
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color(0xff6393F2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * 0.07,
                      padding: EdgeInsets.only(
                        left: size.width * 0.07,
                        right: size.width * 0.07,
                      ),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.02),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: size.width * 0.07,
                            right: size.width * 0.07,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/contacts.svg",
                                    height: size.height * 0.025,
                                    color: Color(0xff6393F2),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Contactez-nous',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: size.height * 0.025,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff6393F2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/out.svg",
                          height: size.height * 0.025,
                          color: Color(0xff6393F2),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'deconnexion',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6393F2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 10,
                color: Colors.white,
              ),
            ),
            child: SvgPicture.asset(
              "assets/person.svg",
              height: size.height * 0.15,
            ),
          ),
        ],
      ),
    );
  }
}
