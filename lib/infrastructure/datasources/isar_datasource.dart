import 'package:isar/isar.dart';

import 'package:path_provider/path_provider.dart';

import 'package:cinemapedia/domain_/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain_/entities/movie.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await openDB();

    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return isFavoriteMovie != null ? true : false;
  }

  @override
  Future<List<Movie>> loadFavoritesMovies(
      {int limit = 10, int offset = 0}) async {
    final isar = await openDB();

    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await openDB();
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    return await isar.writeTxn(() async {
      if (favoriteMovie != null) {
        await isar.movies.delete(favoriteMovie.isarId!);
      } else {
        await isar.movies.put(movie);
      }
    });
  }
}
