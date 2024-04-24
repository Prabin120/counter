// import 'dart:js';

import 'package:counter/pages/home/bloc/home_blocs.dart';
import 'package:counter/pages/home/ui/home.dart';
import 'package:counter/pages/sign_in/ui/sign_in.dart';
import 'package:counter/pages/welcome/bloc/bloc_bloc.dart';
// import 'package:counter/home/ui/home.dart';
import 'package:counter/pages/welcome/ui/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget { 
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc()
        ),
        BlocProvider(
          lazy: true,
          create: (context) => HomeBlocs()
        ),
      ],
      child: ScreenUtilInit(builder: ((context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        routes: {
          "homePage":(context) => const Home(),
          // "welcomePage":(context) => const Welcome()
          "signInPage":(context) => const SignIn(),
        },
      ))),
    );
  }
}
