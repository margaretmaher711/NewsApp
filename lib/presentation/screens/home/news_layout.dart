import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/controllers/news_cubit.dart';
import 'package:newsapp/presentation/controllers/news_states.dart';
import 'package:newsapp/presentation/search/search_screen.dart';
import '../../../shared/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              titleSpacing: 20,
              title: const Text(
                'News App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SearchScreen()),
                        ));
                  },
                ),
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                )
              ],
            ),
            body: NewsCubit.get(context)
                .screens[NewsCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: NewsCubit.get(context).currentIndex,
              items: NewsCubit.get(context).bottomNavigationBarItem,
              onTap: ((index) {
                NewsCubit.get(context).changeBottomNavBar(index);
              }),
            ));
      },
    );
  }
}
