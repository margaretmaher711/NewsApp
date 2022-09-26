import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/components/components.dart';
import 'package:newsapp/presentation/controllers/news_cubit.dart';
import 'package:newsapp/presentation/controllers/news_states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: ((context, state) {}),
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
            child: Column(
              children: [
                Component.defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'search can\'t be empty';
                      }
                      return null;
                    },
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    label: 'Search',
                    prefix: Icons.search),
                Expanded(child: Component.articleBuilder(list, context,isSearch: true))
              ],
            ),
          ),
        );
      },
    );
  }
}
