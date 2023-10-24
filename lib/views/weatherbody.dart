import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/getcurrentweathercubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weathermodel..dart';

class Weatherbody extends StatelessWidget {
  const Weatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    Weathermodel weathermodel =
        BlocProvider.of<Getcurrentweathercubit>(context).weathermodel!;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeData(weathermodel.States)[500]!,
              getThemeData(weathermodel.States)[100]!,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weathermodel.city_name,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.jm().format(DateTime.now()),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weathermodel.image}"),
                Text(
                  "${weathermodel.avgtemp.round()}",
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "maxtemp:${weathermodel.maxtemp}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "mintemp:${weathermodel.mintemp}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            weathermodel.States,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    ));
  }
}
