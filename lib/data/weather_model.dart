



class WeatherModel  {
  var temp;
  var temp_min;
  var temp_max;
  var location;
  var city;
  var humidity;
  var windSpeed;
  var pressure;
  var condition;

  WeatherModel(
      {this.temp,
      this.temp_min,
      this.temp_max,
      this.location,
      this.city,
      this.humidity,
      this.windSpeed,
      this.pressure,
      this.condition});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
        temp: json['main']['temp'],
        temp_min:json['main']['temp_min'] ,
        temp_max: json['main']['temp_max'],
        location: json['sys']['country'],
        city: json['name'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        pressure: json['main']['pressure'],
        condition: json['weather'][0]['id']);
  }


}
