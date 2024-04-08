import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/cubit_observal.dart';
import 'package:news_app/shared/network/local/sharedprefrence.dart';
import 'package:news_app/shared/network/remote/dio.dart';
import 'package:news_app/shared/style/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CashHelper.init();

  bool? isDark = CashHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  // ignore: use_key_in_widget_constructors
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..changeAppMode(fcDark: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return MaterialApp(
              home: NewsScreen(),
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            );
          },
          listener: (context, state) {}),
    );
  }
}
