import 'package:flutter/material.dart';
// import 'package:hyper_ui/shared/util/tap_handler/tap_handler.dart';

Widget floatingAction({
  required Function onPressed,
}) {
  return FloatingActionButton(
    heroTag: UniqueKey(),
    onPressed: () {
      // if (tapProtected) return;
      onPressed();
    },
    child: const Icon(Icons.add),
  );
}
