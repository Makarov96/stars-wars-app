part of './people_bloc.dart';

class PeopleBinding extends Equatable {
  const PeopleBinding({
    required this.previousDetails,
    required this.currentDetails,
    required this.status,
    required this.filtered,
    required this.filters,
  });

  final List<Details> currentDetails;
  final List<Details> previousDetails;
  final STATUSOFDATA status;
  final String filtered;
  final List<Gender> filters;

  PeopleBinding copyWith({
    List<Details>? currentDetails,
    List<Details>? previousDetails,
    STATUSOFDATA? status,
    String? filtered,
    List<Gender>? filters,
  }) {
    return PeopleBinding(
      currentDetails: currentDetails ?? this.currentDetails,
      previousDetails: previousDetails ?? this.previousDetails,
      status: status ?? this.status,
      filtered: filtered ?? this.filtered,
      filters: filters ?? this.filters,
    );
  }

  @override
  List<Object?> get props => [
        previousDetails,
        currentDetails,
        status,
      ];

  @override
  String toString() {
    return 'PeopleBinding(currentDetails: $currentDetails, previousDetails: $previousDetails, status: $status, filtered: $filtered, filters: $filters)';
  }
}
