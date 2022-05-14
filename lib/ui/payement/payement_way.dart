import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PayementWay extends StatefulWidget {
  PayementWay({Key? key}) : super(key: key);
  int index = -1;
  int montant = 0;

  @override
  State<PayementWay> createState() => _PayementState();
}

class _PayementState extends State<PayementWay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Méthode de payment',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Veulliez choisir la méthode de payement",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.index = 0;
                        });
                      },
                      child: Container(
                        height: size.width * 0.33,
                        width: size.width * 0.33,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: widget.index == 0
                                    ? Color(0xff6393F2)
                                    : Colors.transparent),
                            color: widget.index == 0
                                ? Color(0x266393F2)
                                : Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset(
                            "assets/CIB.svg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.index = 1;
                        });
                      },
                      child: Container(
                        height: size.width * 0.33,
                        width: size.width * 0.33,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: widget.index == 1
                                    ? Color(0xff6393F2)
                                    : Colors.transparent),
                            color: widget.index == 1
                                ? Color(0x266393F2)
                                : Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset(
                            "assets/AlgeriePoste.svg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Quantité",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (widget.montant == 0) return;
                                widget.montant -= 500;
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/minuse.svg",
                              height: size.height * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Text(
                              widget.montant.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.montant += 500;
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/plus.svg",
                              height: size.height * 0.05,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      if (widget.index == -1) return;
                      if (widget.montant == 0) return;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          content: Container(
                            height: size.height * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon:
                                          SvgPicture.asset("assets/cancel.svg"),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  "assets/Vectorx.svg",
                                  height: size.height * 0.1,
                                ),
                                Text(
                                  'the payment was successfully made',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                MyCard(montant: widget.montant.toString()),
                                Container(
                                  alignment: Alignment.center,
                                  width: size.width * 0.78,
                                  height: size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.02),
                                    color: widget.index == -1
                                        ? Colors.grey
                                        : Color(0xff6393F2),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.home, color: Colors.white),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Text(
                                        'Accueil',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width * 0.78,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height * 0.02),
                        color: Color(0xff6393F2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            'confirmer',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.montant,
  }) : super(key: key);

  final String montant;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.2,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "13/05/2022 08:30",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0),
                ),
              ],
            ),
            ListTile(
                leading: SvgPicture.asset(
                  'assets/station_gris.svg',
                  height: 40,
                  width: 40,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Station service pva chark",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 13.0),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Color(0xFFC4C4C4),
                        ),
                        Text(
                          "Hai Kahouadji",
                          style: TextStyle(
                              color: Color(0xFFC4C4C4),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0),
                        ),
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: SvgPicture.asset(
                'assets/wallet_gris.svg',
                height: 40,
                width: 40,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    montant.toString(),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.0),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/SmallWallet.svg',
                        height: 13,
                        width: 13,
                      ),
                      Text(
                        "  Carte Eddahabia",
                        style: TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
