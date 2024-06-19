import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';


class DataWidget extends StatelessWidget {
  DataWidget({super.key, required this.value, required this.name, required this.iconName,required this.unit});

  var value;
  String name;
  IconData iconName;
  String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoxedIcon(
          iconName,
          size: 60,
          color: Colors.blueGrey.shade500,
        ),
        Text(
          value.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        Text(
          unit,
          style: const TextStyle(color: Colors.white, fontSize: 20,fontStyle: FontStyle.italic),
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.lightBlue, fontSize: 22,fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}
