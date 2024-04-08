import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: textSearch,
                    onTap: () {},
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(),
                      label: Text('Search',style: TextStyle(color: Colors.grey),),
                      prefix: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return ('this must not be Empty ..');
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: buildScreenBuilder(list,isSearch:true,),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
