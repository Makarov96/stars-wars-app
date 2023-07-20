import 'package:stars_wars_app/features/people/data/model/film_model.dart';
import 'package:stars_wars_app/features/people/data/model/people.dart';

class Generic {
  static T fromJson<T>(dynamic json) {
    if (T == PoepleModel) {
      return PoepleModel.fromJson(json) as T;
    } else if (T == FilmsModel) {
      return FilmsModel.fromJson(json) as T;
    } else if (T == bool || T == String || T == int || T == double) {
      // primitives
      return json;
    } else {
      throw Exception("Unknown class");
    }
  }
}

abstract class StartWarsHttp {
  Future<T> get<T>({
    required String path,
  });
}
