class MoviesStates{}

class GetMoviesLoadingState extends MoviesStates{}
class GetMoviesFailedState extends MoviesStates{
  final String msg;

  GetMoviesFailedState({required this.msg});
}
class GetMoviesSuccessState extends MoviesStates{}