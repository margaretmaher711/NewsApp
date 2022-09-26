import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/components/components.dart';
import 'package:newsapp/presentation/controllers/news_cubit.dart';
import 'package:newsapp/presentation/controllers/news_states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return Component.articleBuilder(list,context);
      },
    );
  }
}
