import 'package:flutter/material.dart';

import '../../constants.dart';


class CityDetailsWidgets extends StatelessWidget {
  const CityDetailsWidgets(
      {super.key,
        required this.formattedDate,
        required this.city,
        required this.country});

  final String formattedDate;
  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          style: TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900),
        ),
        Text(
          country,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.yellowAccent.shade400),
        ),
        Container(
          child: Text(
            '$formattedDate',
            style: TextStyle(color: Color(0xFFFF64D4), fontSize: 25),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25),
          decoration: kBlackContainerDecoration,
        ),
      ],
    );
  }
}
