import 'package:cinemapedia/domain_/entities/actor.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorsByMovie( String movieId );
}
