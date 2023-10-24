import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/weatherstatescubit.dart';
import 'package:weatherapp/models/weathermodel..dart';
import 'package:weatherapp/services/weatherservice.dart';

class Getcurrentweathercubit extends Cubit<Weatherstate> {
  Getcurrentweathercubit() : super(Initweather());
  Weathermodel? weathermodel;
  currentweather({required String City_name}) async {
    try {
      weathermodel =
          await Weatherservice(Dio()).getcurrentweather(city_name: City_name);
      emit(Weatheruploaded(weathermodel: weathermodel));
    } catch (e) {
      print(e.toString());
      emit(Weatherfailure());
    }
  }
}
