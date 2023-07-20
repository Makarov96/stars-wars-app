import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stars_wars_app/container.dart';
import 'package:stars_wars_app/core/utils/base/base_state_notifier.dart';
import 'package:stars_wars_app/features/people/presenter/bloc/listener.dart';
import 'package:stars_wars_app/features/people/presenter/widget/cards/card_people.dart';
import 'package:stars_wars_app/features/widgets/cube_frame.dart';

class PeopleLayout extends ConsumerWidget {
  const PeopleLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      peopleBloc,
      (previus, next) => PeopleListener.homeListener(previus, next, context),
    );
    final binding = ref.watch(peopleBloc);

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            ref.read(peopleBloc.notifier).getPeople();
            return true;
          }
        }
        return true;
      },
      child: Stack(
        children: [
          AbsorbPointer(
            absorbing: binding.status == STATUSOFDATA.loading ||
                binding.status == STATUSOFDATA.failure,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => PeopleCard(
                      details: binding.currentDetails[index],
                    ),
                    childCount: binding.currentDetails.length,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 100,
            right: 70,
            child: CubeFrame(),
          ),
          binding.status == STATUSOFDATA.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
