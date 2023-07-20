import 'package:equatable/equatable.dart';

class Films extends Equatable {
  const Films({
    required this.title,
  });

  final String title;
  @override
  List<Object?> get props => [title];
}
