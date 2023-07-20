import 'package:equatable/equatable.dart';

class Details extends Equatable {
  const Details({
    required this.name,
    required this.height,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.gender,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
  });

  final String name;
  final String height;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final Gender gender;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;

  @override
  List<Object?> get props => [
        name,
        height,
        hairColor,
        skinColor,
        eyeColor,
        gender,
        films,
        species,
        vehicles,
        starships,
      ];
}

enum Gender {
  male,
  na,
  female,
  clear
}

final genderValues = EnumValues({
  'clear': Gender.clear,
  'female': Gender.female,
  'male': Gender.male,
  'n/a': Gender.na,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }

  List<T> get toList =>map.entries.map((e) => e.value).toList();
}



