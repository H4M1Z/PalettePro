import 'package:flutter_riverpod/flutter_riverpod.dart';

class PenAddedInRemovedChache extends StateNotifier<bool> {
  PenAddedInRemovedChache() : super(true);

  void addInRemovedChache() {
    state = false;
  }

  void removeFromRemovedChache() {
    state = true;
  }
}
