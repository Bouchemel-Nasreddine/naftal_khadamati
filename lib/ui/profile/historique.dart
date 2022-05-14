import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Historique extends StatefulWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  String montant = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "Historique des factures",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            )),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              MyCard(montant: "500 DA "),
              MyCard(montant: "1000 DA "),
              MyCard(montant: "750 DA "),
            ],
          ),
        ));
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
                          "Hai Kahouadji Hamoud Dar El Beida",
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
