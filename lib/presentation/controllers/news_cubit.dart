import 'package:flutter/material.dart';
import 'package:newsapp/presentation/controllers/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/screens/business/business_screen.dart';
import 'package:newsapp/presentation/screens/science/science_screen.dart';
import 'package:newsapp/presentation/screens/sports/sports_screen.dart';

import '../../core/network/dio_helper.dart';
import '../screens/settings/settings.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitiState());

  static NewsCubit get(context) => BlocProvider.of(context);

  static int currentIndex = 0;

  static List<dynamic> business = [];
  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'category': 'business',
        'country': 'us',
        'apiKey': '936baf92deca4675855c1a60bd63921d',
      },
    )
        .then((value) => {
              business = value.data['articles'],
              print(business[0]['title']),
              emit(NewsBusinessSuccesState())
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  static List<dynamic> sports = [];
  void getSports() {
    emit(NewsSportsLoadingState());
    DioHelper.getData(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'category': 'sports',
        'country': 'eg',
        'apiKey': '936baf92deca4675855c1a60bd63921d',
      },
    )
        .then((value) => {
              sports = value.data['articles'],
              print(sports[0]['title']),
              emit(NewsSportsSuccesState())
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsSportsErrorState(error.toString()));
    });
  }

 static List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoadingState());
    DioHelper.getData(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {
        'category': 'science',
        'country': 'us',
        'apiKey': '936baf92deca4675855c1a60bd63921d',
      },
    )
        .then((value) => {
              science = value.data['articles'],
              print(science[0]['title']),
              emit(NewsScienceSuccesState())
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  static List<BottomNavigationBarItem> bottomNavigationBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  static List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {

    currentIndex = index;
if (currentIndex==1) {
  getSports();
}
    emit(NewsBottomNavState());
  }
}
