class Weathermodel {
  final String city_name;
  final DateTime date;
  final String States;
  final double maxtemp;
  final double mintemp;
  final double avgtemp;
  final String image;

  Weathermodel(
      {required this.image,
      required this.States,
      required this.avgtemp,
      required this.city_name,
      required this.date,
      required this.maxtemp,
      required this.mintemp});
  factory Weathermodel.fromjson(json) {
    return Weathermodel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      States: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      avgtemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      city_name: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
    );
  }
}
