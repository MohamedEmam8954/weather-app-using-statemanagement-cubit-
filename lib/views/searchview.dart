import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/getcurrentweathercubit/getcurrentweathercubit.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("search"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onSubmitted: (value) async {
              var weather = BlocProvider.of<Getcurrentweathercubit>(context);
              weather.currentweather(City_name: value);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              label: const Text("search"),
              labelStyle: const TextStyle(fontSize: 18),
              hintText: "enter city_name",
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
