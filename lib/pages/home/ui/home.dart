import 'package:counter/pages/home/bloc/home_blocs.dart';
import 'package:counter/pages/home/bloc/home_events.dart';
import 'package:counter/pages/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: SafeArea(child: Center(
        child: BlocBuilder<HomeBlocs, HomeStates>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<HomeBlocs>(context).add(Decrement()); 
                    }, icon: Icon(Icons.access_alarms_rounded)),
                SizedBox(
                  width: 15,
                ),
                Text("${BlocProvider.of<HomeBlocs>(context).state.counter}"),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                    onPressed: ()=> BlocProvider.of<HomeBlocs>(context).add(Increment()), icon: Icon(Icons.access_alarms_rounded)),
              ],
            );
          },
        ),
      )),
    ));
  }
}
