import 'package:connect_movies/screens/movies/item_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'states.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getData(),
      child: Builder(builder: (context) {
        final cubit = MoviesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Movies"),
            centerTitle: true,
          ),
          body: BlocBuilder<MoviesCubit, MoviesStates>(
            builder: (context, state) {
              if (state is GetMoviesLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetMoviesFailedState) {
                return Center(
                  child: Text(state.msg),
                );
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) => ItemMovie(model: cubit.allList[index]),
                itemCount: cubit.allList.length,
              );
            },
          ),
        );
      }),
    );
  }
}
