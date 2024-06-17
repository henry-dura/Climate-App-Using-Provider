import 'package:flutter/material.dart';


class DataWidget extends StatelessWidget {
  DataWidget({required this.value, required this.name, required this.iconName});

  var value;
  String name;
  IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconName,
          size: 60,
          color: Colors.white70,
        ),
        Text(
          value.toString(),
          style: TextStyle(color: Color(0xFFFF84D4), fontSize: 30),
        ),
        Text(
          name,
          style: TextStyle(color: Colors.yellowAccent.shade400, fontSize: 22,fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}
