import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stars_wars_app/core/http/http.dart';
import 'package:stars_wars_app/core/http/start_wars_http.dart';
import 'package:http/http.dart';
import 'package:stars_wars_app/core/utils/base/base_state_notifier.dart';
import 'package:stars_wars_app/features/people/data/api/people_api.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';
import 'package:stars_wars_app/features/people/domain/repository/people_repository.dart';
import 'package:stars_wars_app/features/people/presenter/bloc/people_bloc.dart';

final _clientProvider = Provider<Client>(
  (ref) => Client(),
);

final httpProvider = Provider<StartWarsHttp>(
  (ref) => STWHttp(
    client: ref.read(_clientProvider),
   
  ),
);

final _peopleRepository = Provider<PeopleRepository>(
  (ref) => PeopleApi(
    http: ref.read(httpProvider),
  ),
);

final peopleBloc = StateNotifierProvider<PeopleBloc, PeopleBinding>(
  (ref) => PeopleBloc(
    PeopleBinding(
      previousDetails: const [],
      currentDetails: const [],
      status: STATUSOFDATA.init,
      filtered: 'clear',
      filters: genderValues.toList,
    ),
    repository: ref.read(_peopleRepository),
  ),
);
