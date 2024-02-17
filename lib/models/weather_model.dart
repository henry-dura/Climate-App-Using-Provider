import 'package:flutter/material.dart';

class WeatherModel{
  var currentTemperature;
  var minTemperature;
  var maxTemperature;
  var location;
  var city;
  var humidity;
  var  windSpeed;
  var pressure;
  var condition;
  WeatherModel({this.currentTemperature,this.minTemperature,this.maxTemperature,this.location,this.city,this.humidity,this.windSpeed,this.pressure,this.condition});
}