import 'package:stars_wars_app/features/people/domain/entity/films.dart';

class FilmsModel extends Films {
  const FilmsModel({
    required String title,
  }) : super(
          title: title,
        );

  factory FilmsModel.fromJson(Map<String, dynamic> json) => FilmsModel(
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
