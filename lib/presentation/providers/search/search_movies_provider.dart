import 'package:cinemapedia/domain_/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return SearchMoviesNotifier(
    searchMoviesCallback: movieRepository.getSearchMovies, 
    ref: ref
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function({ required String query});

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMoviesCallback;
  final Ref ref;
  SearchMoviesNotifier({required this.searchMoviesCallback, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery({ required String query}) async {
    final List<Movie> movies = await searchMoviesCallback(query: query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
