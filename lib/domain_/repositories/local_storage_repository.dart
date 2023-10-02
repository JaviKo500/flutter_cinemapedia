

import 'package:cinemapedia/domain_/entities/movie.dart';

abstract class LocalStorageRepository  {
  
  Future<void> toggleFavorite( Movie movie );
  Future<bool> isMovieFavorite( int movieId );
  Future<List<Movie>> loadFavoritesMovies( { int limit = 10, int offset = 0 } );
  
}