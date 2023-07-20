import 'package:equatable/equatable.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';

class People extends Equatable {
  const People({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final num count;
  final String next;
  final String previous;
  final List<Details> results;
  @override
  List<Object> get props => [
        count,
        next,
        previous,
        results,
      ];
}
