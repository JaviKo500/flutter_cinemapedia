import 'package:cinemapedia/domain_/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain_/entities/actor.dart';
import 'package:cinemapedia/domain_/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDataSource dataSource;

  ActorRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}
