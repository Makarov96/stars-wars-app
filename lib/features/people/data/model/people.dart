import 'package:stars_wars_app/features/people/data/model/details.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';
import 'package:stars_wars_app/features/people/domain/entity/people.dart';

class PoepleModel extends People {
  const PoepleModel({
    required num count,
    required String next,
    required String previous,
    required List<Details> results,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );

  factory PoepleModel.fromJson(Map<String, dynamic> json) => PoepleModel(
        count: json['count'] ?? '',
        next: json['next'] ?? '',
        previous: json['previous'] ?? '',
        results:
            List<Details>.from(json["results"].map((x) => DetailsModel.fromJson(x))),
      );

 
}
