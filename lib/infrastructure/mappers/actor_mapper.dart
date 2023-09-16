import 'package:cinemapedia/domain_/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/movieDB/credits_response.dart';

class ActorMapper {
  static Actor castDBToEntity(Cast castDb) =>
      Actor(
        id: castDb.id, 
        name: castDb.name, 
        profilePath: castDb.profilePath != '' 
          ? 'https://image.tmdb.org/t/p/w500${castDb.profilePath}'
          : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg', 
        character: castDb.character
      );
}
