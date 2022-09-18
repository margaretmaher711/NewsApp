import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/controllers/news_cubit.dart';
import 'package:newsapp/presentation/controllers/news_states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
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
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              body: NewsCubit.screens[NewsCubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: NewsCubit.currentIndex,
                items: NewsCubit.bottomNavigationBarItem,
                onTap: ((index) {
                  NewsCubit().changeBottomNavBar(index);
                }),
              ));
        },
      ),
    );
  }
}
