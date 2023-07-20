import 'package:stars_wars_app/features/people/domain/entity/details.dart';

class DetailsModel extends Details {
  const DetailsModel({
    required String name,
    required String height,
    required String hairColor,
    required String skinColor,
    required String eyeColor,
    required Gender gender,
    required List<String> films,
    required List<String> species,
    required List<String> vehicles,
    required List<String> starships,
  }) : super(
          name: name,
          height: height,
          hairColor: hairColor,
          skinColor: skinColor,
          eyeColor: eyeColor,
          gender: gender,
          films: films,
          species: species,
          vehicles: vehicles,
          starships: starships,
        );

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        name: json['name'] ?? '',
        height: json['height'] ?? '',
        hairColor: json['hair_color'] ?? '',
        skinColor: json['skin_color'] ?? '',
        eyeColor: json['eye_color'] ?? '',
        gender: genderValues.map[json['gender']] ?? Gender.na,
        films: List<String>.from((json['films'] ?? []).map((x) => x)),
        species: List<String>.from((json['species'] ?? []).map((x) => x)),
        vehicles: List<String>.from((json['vehicles'] ?? []).map((x) => x)),
        starships: List<String>.from((json['starships'] ?? []).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'height': height,
        'hair_color': hairColor,
        'skin_color': skinColor,
        'eye_color': eyeColor,
        'films': List<dynamic>.from(films.map((x) => x)),
        'species': List<dynamic>.from(species.map((x) => x)),
        'vehicles': List<dynamic>.from(vehicles.map((x) => x)),
        'starships': List<dynamic>.from(starships.map((x) => x)),
      };
}
