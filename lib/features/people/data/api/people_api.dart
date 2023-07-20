
import 'package:oxidized/oxidized.dart';
import 'package:stars_wars_app/core/http/start_wars_http.dart';
import 'package:stars_wars_app/features/people/data/model/film_model.dart';
import 'package:stars_wars_app/features/people/data/model/people.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';
import 'package:stars_wars_app/core/utils/failures/failures.dart';
import 'package:stars_wars_app/features/people/domain/repository/people_repository.dart';

class PeopleApi extends PeopleRepository {

  PeopleApi({
    required StartWarsHttp http,
  }) : _http = http;
  final StartWarsHttp _http;
  
  @override
  Future<Result<List<Details>, GenericException>> getPeople({
    required int pageCount,
  }) async {
    String path = '/api/people/?page=$pageCount';
    final result = await _http.get<PoepleModel>(
      path: path,
    );
    final films = result.results.map((e) => e.films).toList().first;
    final infoFilms = await getFilms(apis: films);
    final unwrap = infoFilms.ok().unwrap();
    final convertList = result.results.map((e) {
      e.films.clear();
      e.films.addAll(unwrap);
      return e;
    }).toList();

    return Result.of(
      () {
        return convertList;
      },
    );
  }

  @override
  Future<Result<List<String>, GenericException>> getFilms({
    required List<String> apis,
  }) async {
    final newList = apis.map(
      (e) async {
        var pathConverter = e.substring(17, e.length);
        final result = await _http.get<FilmsModel>(
          path: pathConverter,
        );

        return result.title;
      },
    ).toList();

    final values = await Future.wait(newList);

    return Result.of(
      () => values,
    );
  }
}
