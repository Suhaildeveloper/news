
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states_all.dart';
import 'package:news_app/shared/network/local/sharedprefrence.dart';

class AppNewsCubit extends Cubit<AppNewsState> {
  AppNewsCubit() : super(AppNewsInitialState());

  static AppNewsCubit get(context) => BlocProvider.of(context);

  // bool isDark = true;
  // void changeAppMode({
  //   bool? fcDark,
  // }) {
  //   if (fcDark != null) {
  //     isDark = fcDark;
  //     emit(AppNewsChangeAppMode());
  //    print('Dark');
  //   } else {
  //     isDark = !isDark;
  //     CashHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      
  //       emit(AppNewsChangeAppMode());
  //          print('Light');
  //     });
  //   }
  // }

  
}
