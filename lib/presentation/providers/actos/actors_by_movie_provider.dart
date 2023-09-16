import 'package:cinemapedia/domain_/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actos/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final getActorsByMovieId  = ref.watch(actorsRepositoryProvider).getActorsByMovie;

  return ActorsByMovieNotifier(getActors: getActorsByMovieId);
});

/// {
/// '5225': <Actor> []
/// '5221': <Actor> []
/// '5226': <Actor> []
/// }

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActors;
  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List< Actor > actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
