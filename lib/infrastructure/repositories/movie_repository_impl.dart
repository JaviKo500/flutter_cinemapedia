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

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasources.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasources.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById({required String id}) {
    return datasources.getMovieById(id: id);
  }

  @override
  Future<List<Movie>> getSearchMovies({required String query}) {
    // TODO: implement getSearchMovies
    return datasources.getSearchMovies(query: query);
  }
}
