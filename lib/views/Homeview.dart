import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/getcurrentweathercubit.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/weatherstatescubit.dart';
import 'package:weatherapp/views/noweather.dart';

import 'package:weatherapp/views/searchview.dart';
import 'package:weatherapp/views/weatherbody.dart';

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather app"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Searchview();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<Getcurrentweathercubit, Weatherstate>(
          builder: (context, state) {
            if (state is Initweather) return const Noweather();
            if (state is Weatheruploaded) {
              return Weatherbody();
            } else if (state is Weatherfailure) {}
            return const Center(
              child: Text("obs there is an error try later"),
            );
          },
        ));
  }
}
