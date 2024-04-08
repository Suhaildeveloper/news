import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/sceince/sceince.dart';
import 'package:news_app/modules/setting/settings.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/sharedprefrence.dart';
import 'package:news_app/shared/network/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState()); // create Constractor method

  static NewsCubit get(context) =>
      BlocProvider.of(context); // create object from class

  int curentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SceinceScreen(),
    SportScreen(),
    SettingScreen(),
  ];
  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Scinces'),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];

  void changeBottomNav(int index) {
    curentIndex = index;
    if (curentIndex == 1) getSceince();
    if (curentIndex == 2) getSport();
    emit(NewsBottomNavState());
  }

  List business = [];
  List sceince = [];
  List sport = [];
  List search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '724828b6cf4f47cabebf15cc0b8fe829',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  void getSceince() {
    emit(NewsGetSceinceLoadingState());
    if (sceince.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '724828b6cf4f47cabebf15cc0b8fe829',
        },
      ).then((value) {
        sceince = value.data['articles'];
        emit(NewsGetSceinceSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSceinceErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  void getSport() {
    emit(NewsGetSportLoadingState());
    if (sport.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sport',
          'apiKey': '724828b6cf4f47cabebf15cc0b8fe829',
        },
      ).then((value) {
        sport = value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

   void getSearch(String valu) {
    emit(NewsGetSearchLoadingState());
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$valu',
          'apiKey': '724828b6cf4f47cabebf15cc0b8fe829',
        },
      ).then((value) {
        search = value.data['articles'];
        emit(NewsGetSearchSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSearchErrorState(onError.toString()));
      });
  }

  bool isDark = false;

  Future<dynamic> changeAppMode({
    bool? fcDark,
  }) async {
    if (fcDark != null) {
      isDark = fcDark;
      emit(AppNewsChangeMode());
      print('Dark');
    } else {
      isDark = !isDark;
      CashHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppNewsChangeMode());
        print('Light');
      }).catchError((Erorr) {
        print('Error from ChangeAppMode method .. ');
        print(Erorr.toString());
      });
    }
  }
}
