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
