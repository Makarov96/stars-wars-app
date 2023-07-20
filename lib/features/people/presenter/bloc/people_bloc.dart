import 'package:equatable/equatable.dart';
import 'package:stars_wars_app/core/utils/base/base_state_notifier.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';
import 'package:stars_wars_app/features/people/domain/repository/people_repository.dart';
part 'people_binding.dart';

class PeopleBloc extends BaseStateNotifier<PeopleBinding> {
  PeopleBloc(
    PeopleBinding state, {
    required PeopleRepository repository,
  })  : _repository = repository,
        super(state) {
    getPeople();
  }
  final PeopleRepository _repository;
  int pageCount = 1;
  List<Details> tempList = [];

  void getPeople() async {
    if (pageCount == 9) return;
    statusofdata = STATUSOFDATA.loading;
    state = state.copyWith(status: statusofdata);
    final result = await _repository.getPeople(
      pageCount: pageCount,
    );
    result.when(
      ok: (data) {
        pageCount++;
        tempList.addAll(data);
        statusofdata = STATUSOFDATA.success;
        if (state.filtered == Gender.clear.name) {
          state = state.copyWith(
            currentDetails: tempList,
            status: statusofdata,
            previousDetails: tempList,
          );
        } else {
          state = state.copyWith(
            currentDetails: tempList.findByGender(input: state.filtered),
            status: statusofdata,
            previousDetails: tempList,
          );
        }
      },
      err: (failure) {
        statusofdata = STATUSOFDATA.failure;
        state = state.copyWith(
          status: statusofdata,
        );
      },
    );
  }

  void findByGender({
    required String gender,
  }) {
    final newList = tempList.findByGender(input: gender);
    state = state.copyWith(
      currentDetails:
          gender == Gender.clear.name ? state.previousDetails : newList,
      filtered: gender,
    );
  }
}

extension ConvertionList on List<Details> {
  List<Details> findByGender({required String input}) =>
      where((element) => element.gender.name == input).toList();
}
