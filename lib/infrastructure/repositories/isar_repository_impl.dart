import 'package:cinemapedia/domain_/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain_/entities/movie.dart';
import 'package:cinemapedia/domain_/repositories/local_storage_repository.dart';

class IsarRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  IsarRepositoryImpl(this.datasource);

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadFavoritesMovies({int limit = 10, int offset = 0}) {
    return datasource.loadFavoritesMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    throw datasource.toggleFavorite(movie);
  }
}
