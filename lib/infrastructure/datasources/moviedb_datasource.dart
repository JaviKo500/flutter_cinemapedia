import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain_/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain_/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/movie_respose.dart';
import 'package:dio/dio.dart';

class MovieBbDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: "https://api.themoviedb.org/3/", queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'ex-MX'
    }),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page
    });

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page
    });
    return _jsonToMovies(response.data);
  }

  List< Movie > _jsonToMovies( Map<String, dynamic> json ) {
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies =
        movieDBResponse.results
        .where((movie) => movie.posterPath != '')
        .map((movie) => MovieMapper.movieDBToEntity(movie)).toList();

    return movies;
  }
}
