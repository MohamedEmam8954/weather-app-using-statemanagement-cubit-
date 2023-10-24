import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/getcurrentweathercubit.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/weatherstatescubit.dart';
import 'package:weatherapp/models/weathermodel..dart';
import 'package:weatherapp/views/Homeview.dart';

void main() {
  runApp(const Weatherapp());
}

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getcurrentweathercubit(),
      child: BlocBuilder<Getcurrentweathercubit, Weatherstate>(
        builder: (context, state) {
          return Builder(
            builder: (context) {
              Weathermodel? weather =
                  BlocProvider.of<Getcurrentweathercubit>(context).weathermodel;
              String condition = weather?.States ?? "";
              return MaterialApp(
                theme: ThemeData(primarySwatch: getThemeData(condition)),
                debugShowCheckedModeBanner: false,
                home: const Home_view(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeData(String condition) {
  if (condition.toLowerCase() == "sunny") {
    return Colors.amber;
  } else if (condition.toLowerCase() == "partly cloudy") {
    return Colors.blue;
  } else if (condition.toLowerCase() == "cloudy") {
    return Colors.grey;
  } else if (condition.toLowerCase() == "overcast") {
    return Colors.grey;
  } else if (condition.toLowerCase() == "mist") {
    return Colors.grey;
  } else if (condition.toLowerCase() == "patchy rain possible") {
    return Colors.blue;
  } else if (condition.toLowerCase() == "patchy freezing drizzle possible") {
    return Colors.grey;
  } else if (condition.toLowerCase() == "thundery outbreaks possible") {
    return Colors.red;
  } else if (condition.toLowerCase() == "blowing snow" ||
      condition.toLowerCase() == "blizzard") {
    return color_white();
  } else if (condition.toLowerCase() == "light sleet" ||
      condition.toLowerCase() == "moderate or heavy sleet") {
    return Colors.grey;
  } else if (condition.toLowerCase() == "light snow showers" ||
      condition.toLowerCase() == "moderate or heavy snow showers") {
    return color_white();
  } else if (condition.toLowerCase() == "light showers of ice pellets" ||
      condition.toLowerCase() == "moderate or heavy showers of ice pellets") {
    return Colors.grey;
  } else if (condition.toLowerCase() == "patchy light snow with thunder" ||
      condition.toLowerCase() == "moderate or heavy snow with thunder") {
    return color_white();
  } else {
    return Colors.blue; // Default color (white) for conditions not specified
  }
}

MaterialColor color_white() {
  return MaterialColor(0xFFFFFFFF, {
    50: Colors.white.withOpacity(0.1),
    100: Colors.white.withOpacity(0.2),
    200: Colors.white.withOpacity(0.3),
    300: Colors.white.withOpacity(0.4),
    400: Colors.white.withOpacity(0.5),
    500: Colors.white.withOpacity(0.6),
    600: Colors.white.withOpacity(0.7),
    700: Colors.white.withOpacity(0.8),
    800: Colors.white.withOpacity(0.9),
    900: Colors.white.withOpacity(1.0),
  });
}
