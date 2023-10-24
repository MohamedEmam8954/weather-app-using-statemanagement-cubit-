import 'package:dio/dio.dart';
import 'package:weatherapp/models/weathermodel..dart';

class Weatherservice {
  Dio dio;
  Weatherservice(this.dio);
  String baseurl = "http://api.weatherapi.com";
  String apikey = "106734fa3fd24a2ca5f204618232310";
  getcurrentweather({required String city_name}) async {
    try {
      Response response = await dio.get(
          "$baseurl/v1/forecast.json?key=$apikey&q=$city_name&days=1&aqi=no&alerts=no");
      Weathermodel weather = Weathermodel.fromjson(response.data);
      return weather;
    } on DioException catch (e) {
      String errormessage;
      errormessage = e.response?.data["error"]["message"] ??
          "obs there is an error! try later";
      throw Exception(errormessage);
    } catch (e) {
      print(e.toString());
      throw Exception("obs there is an error! try later ");
    }
  }
}
