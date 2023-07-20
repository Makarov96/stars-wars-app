import 'package:flutter/material.dart';
import 'package:stars_wars_app/core/utils/base/base_state_notifier.dart';
import 'package:stars_wars_app/features/people/presenter/module.dart';

class PeopleListener {
  static void homeListener(previous, next, BuildContext context) {
    if (next.status == STATUSOFDATA.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(PeopleModule.snackBarMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}