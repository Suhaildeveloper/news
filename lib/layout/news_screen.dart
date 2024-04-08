import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/sharedprefrence.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder:(context) => SearchScreen()));
                    },
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      cubit.changeAppMode();
                    },
                    icon: Icon(
                      Icons.brightness_4_outlined,
                    ),
                  ),
                ],
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.curentIndex,
            items: cubit.bottomNav,
            onTap: (value) {
              cubit.changeBottomNav(value);
            },
          ),
          body: cubit.screens[cubit.curentIndex],
        );
      },
    );
  }
}
