import 'package:cinemapedia/domain_/entities/movie.dart';


abstract class MoviesDataSource {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

}