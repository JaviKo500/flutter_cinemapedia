import 'package:cinemapedia/domain_/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain_/entities/movie.dart';
import 'package:cinemapedia/domain_/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource datasources;

  MovieRepositoryImpl(this.datasources);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasources.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasources.getPopular(page: page);
  }
}
