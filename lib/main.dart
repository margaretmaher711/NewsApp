import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/network/dio_helper.dart';
import 'package:newsapp/presentation/controllers/bloc_observer.dart';
import 'package:newsapp/presentation/screens/home/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.deepOrange,
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepOrange,
            type: BottomNavigationBarType.fixed,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          primarySwatch: Colors.deepOrange,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          )),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.deepOrange,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.black26,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black26,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Directionality(
        textDirection: TextDirection.rtl, child: NewsLayout());
  }
}
