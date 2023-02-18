class MoviesData {
  late final int page;
  late final List<Movie> list;
  late final int totalPages;
  late final int totalResults;

  MoviesData.fromJson(Map<String, dynamic> json){
    page = json['page']??0;
    list = List.from(json['results']??[]).map((e)=>Movie.fromJson(e)).toList();
    totalPages = json['total_pages']??0;
    totalResults = json['total_results']??0;
  }
}

class Movie {
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final num popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final num voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json){
    adult = json['adult']??false;
    if(json['backdrop_path']==null)
      {
        backdropPath= "https://filestore.community.support.microsoft.com/api/images/ext?url=https%3A%2F%2Fanswerscdn.microsoft.com%2Fstatic%2Fimages%2Fimage-not-found.jpg";
      }else
        {
          backdropPath = "https://image.tmdb.org/t/p/original${json['backdrop_path']}";
        }

    genreIds = List.castFrom<dynamic, int>(json['genre_ids']??[]);
    id = json['id']??0;
    originalLanguage = json['original_language']??"";
    originalTitle = json['original_title']??"";
    overview = json['overview']??"";
    popularity = json['popularity']??0;
    posterPath = json['poster_path']??"https://filestore.community.support.microsoft.com/api/images/ext?url=https%3A%2F%2Fanswerscdn.microsoft.com%2Fstatic%2Fimages%2Fimage-not-found.jpg";
    releaseDate = json['release_date']??"";
    title = json['title']??"";
    video = json['video']??false;
    voteAverage = json['vote_average']??0;
    voteCount = json['vote_count']??0;
  }
}