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
          style: const TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900),
        ),
        Text(
          country,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.indigoAccent),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: kBlackContainerDecoration,
          child: Text(
            formattedDate,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
