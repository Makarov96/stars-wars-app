import 'package:oxidized/oxidized.dart';
import 'package:stars_wars_app/core/utils/failures/failures.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';

abstract class PeopleRepository {
  Future<Result<List<Details>, GenericException>> getPeople({
    required int pageCount,
  });
  Future<Result<List<String>, GenericException>> getFilms({
    required List<String> apis,
  });
}
