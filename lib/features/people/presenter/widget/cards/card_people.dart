import 'package:flutter/material.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({
    Key? key,
    required this.details,
  }) : super(key: key);
  final Details details;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 100,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: ${details.name}'),
            const Divider(),
            Text('Genero: ${details.gender.name}'),
            const Divider(),
            Column(
              children: [
                const Text('Peliculas:'),
                Column(
                  children: List.generate(
                    details.films.length,
                    (i) => Text(
                      details.films[i],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      margin: const EdgeInsets.all(10),
    );
  }
}
