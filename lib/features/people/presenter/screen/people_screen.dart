import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stars_wars_app/container.dart';
import 'package:stars_wars_app/features/people/domain/entity/details.dart';
import 'package:stars_wars_app/features/people/presenter/widget/layout/people_layout.dart';


class PeopleScreen extends StatelessWidget {
  const PeopleScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                'Filter by:',
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final binding = ref.watch(peopleBloc);

                  return DropdownButton(
                    value: binding.filtered,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    items: binding.filters.map((Gender items) {
                      return DropdownMenuItem(
                        value: items.name,
                        child: Text(
                          items.name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? gender) => ref
                        .read(peopleBloc.notifier)
                        .findByGender(gender: gender ?? ''),
                  );
                },
              ),
            ],
          )
        ],
      ),
      body: const PeopleLayout(),
    );
  }
}
