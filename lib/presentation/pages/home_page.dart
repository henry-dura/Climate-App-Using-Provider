
import 'package:climate_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/city_details_widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';

import '../components/data_widget.dart';
import '../components/spinner.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Initialization tasks

    Future.delayed(Duration.zero, () {
      // Perform your state changes here

    });

  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    // Format the date as a string
    String formattedDate = DateFormat('EEEE, d MMM, yyyy').format(currentDate);
       

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFF64D4),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                TextField(
                cursorHeight: 25,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white70),
                decoration: InputDecoration(
                    hintText: 'Search City',
                    hintStyle: TextStyle(color:Colors.white70),
                    prefixIcon: Icon(Icons.search,size: 45,color: Colors.white70,),
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none)
                ),
                onSubmitted: (String val){
                  if(val.length > 2){
                    // weatherProvider.enteredCity(val);
                    Phoenix.rebirth(context); // refresh app

                  }else{print("Enter valid city");}


                },
              ),
                  SizedBox(
                    height: 20,
                  ),
                  CityDetailsWidgets(
                    formattedDate: formattedDate,
                    city: 'Enugu',
                    country: 'Enugu',
                  ),
                  kSpace,
                  Center(
                    child: Text(
                      'Condition',
                      style: TextStyle(fontSize: 90),
                    ),
                  ),

                  Center(
                    child: Text(
                      'currentTemperature\u00B0C',
                      style: TextStyle(fontSize: 90,fontWeight: FontWeight.w900),
                    ),
                  ),
                  kSpace,
                  Text(
                    'getMessage',
                    style: TextStyle(fontSize: 60,color: Colors.yellowAccent.shade400),
                    textAlign: TextAlign.center,
                  ),
                  kSpace,
                  Container(
                      height: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: kBlackContainerDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DataWidget(
                            iconName: Icons.wind_power,
                            value: 'Speed',
                            name: 'Wind Speed',
                          ),
                          DataWidget(
                            iconName: Icons.cloud_circle_sharp,
                            value: 'humidity',
                            name: 'Humidity',
                          ),
                          DataWidget(
                            iconName: Icons.cloud,
                            value: 'Pressure',
                            name: 'Pressure',
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );

  }
}


