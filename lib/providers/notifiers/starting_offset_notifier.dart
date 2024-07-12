import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartingOffsetNotifier extends StateNotifier<Offset> {
  StartingOffsetNotifier() : super(Offset.zero);

  void newStartingOffset(Offset offset) {
    state = offset;
  }
}
