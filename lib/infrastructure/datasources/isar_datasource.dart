

import 'package:cinemapedia/domain_/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain_/entities/movie.dart';

class IsarDatasource extends LocalStorageDatasource {
  @override
  Future<bool> isMovieFavorite(int movieId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadFavoritesMovies({int limit = 10, int offset = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    throw UnimplementedError();
  }
}