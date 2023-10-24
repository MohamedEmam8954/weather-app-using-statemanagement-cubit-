import 'package:weatherapp/models/weathermodel..dart';

class Weatherstate {}

class Initweather extends Weatherstate {}

class Weatheruploaded extends Weatherstate {
  Weathermodel? weathermodel;
  Weatheruploaded({required this.weathermodel});
}

class Weatherfailure extends Weatherstate {}
