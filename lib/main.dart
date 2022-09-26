import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/network/local/cache_helper.dart';
import 'package:newsapp/core/network/remote/dio_helper.dart';
import 'package:newsapp/presentation/controllers/bloc_observer.dart';
import 'package:newsapp/presentation/controllers/news_cubit.dart';
import 'package:newsapp/presentation/controllers/news_states.dart';
import 'package:newsapp/presentation/screens/home/news_layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/shared/cubit.dart';
import 'package:newsapp/shared/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.inti();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp(this.isDark, {super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience()
            ,
        ),
        BlocProvider(
          create: (context) => AppCubit()..changeMode(fromShared: isDark),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                ),
                iconTheme: const IconThemeData(color: Colors.black),
                primaryColor: Colors.deepOrange,
                buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                )),
            darkTheme: ThemeData(
              primaryColor: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("333739"),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor("333739"),
                elevation: 0,
              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
              scaffoldBackgroundColor: HexColor("333739"),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 40,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor("333739"),
              ),
              iconTheme: const IconThemeData(color: Colors.green),
            ),
          
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
