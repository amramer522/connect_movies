import 'package:connect_movies/screens/movies/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesStates());

  static MoviesCubit get(context) => BlocProvider.of(context);

  int pageNumber = 1;

  List<Movie> allList = [];

  void getData() async {
    emit(GetMoviesLoadingState());
    try{
      final response = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber");
      final model = MoviesData.fromJson(response.data);
      allList = model.list;
      emit(GetMoviesSuccessState());

    }on DioError catch (err){
      emit(GetMoviesFailedState(msg: err.message??"failed"));
      print(err.message??"failed");
    }

  }

  void onLoading() {
    pageNumber++;
    getData();
  }

  void onRefresh() {
    pageNumber = 1;
    getData();
  }
}
