import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stars_wars_app/container.dart';
import 'package:stars_wars_app/core/http/start_wars_http.dart';
import 'package:stars_wars_app/features/people/data/api/people_api.dart';
import 'package:stars_wars_app/features/people/data/model/film_model.dart';
import 'package:stars_wars_app/features/people/data/model/people.dart';
import '../../../../fixture/fixture_reader.dart';

class MockSTWHttp extends Mock implements StartWarsHttp {}

void main() {
  late PeopleApi api;

  late MockSTWHttp http;
  final tPeople = PoepleModel.fromJson(json.decode(fixture('people.json')));
  final tFilms = FilmsModel.fromJson(json.decode(fixture('films.json')));
  setUp(
    () {
      http = MockSTWHttp();
      var container = ProviderContainer();
      api = PeopleApi(
        http: container.read(httpProvider),
      );
    },
  );

  void setUpMockHttpClientSuccess200() async {
    when(
      () => http.get<PoepleModel>(
        path: '/api/people/?page=1',
      ),
    ).thenAnswer((_) async => tPeople);
    final films = tPeople.results.map((e) => e.films).toList().first;

    films.map(
      (e) {
        var pathConverter = e.substring(17, e.length);
        when(
          () => http.get<FilmsModel>(
            path: pathConverter,
          ),
        ).thenAnswer((_) async => tFilms);
      },
    );
  }

  group(
    'should be test failure and success case',
    () {
      test(
        'should be return 200 status',
        () async {
          //arrange
          setUpMockHttpClientSuccess200();
          //act

          final result = await api.getPeople(pageCount: 1);

          result.when(
            ok: (r) {
              expect(r, tPeople.results);
            },
            err: (err) {},
          );
          //assert
        },
      );
    },
  );
}

