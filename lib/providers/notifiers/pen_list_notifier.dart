import 'package:flutter_riverpod/flutter_riverpod.dart';

class PenListNotifier extends StateNotifier<bool> {
  PenListNotifier() : super(false);

  void listIsCreated() {
    state = true;
  }

  void listIsRemoved() {
    state = false;
  }

  bool isListPresent() {
    return state;
  }
}
