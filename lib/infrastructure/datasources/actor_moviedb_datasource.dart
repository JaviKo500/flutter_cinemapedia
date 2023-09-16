import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain_/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain_/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieBbDataSource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'ex-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final creditDBResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> cast = creditDBResponse.cast
        .where((actor) => actor.profilePath != '')
        .map((actor) => ActorMapper.castDBToEntity(actor))
        .toList();
    return cast;
  }
}
