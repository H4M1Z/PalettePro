import 'package:flutter_riverpod/flutter_riverpod.dart';

class PenAddedInMainListNotifier extends StateNotifier<bool> {
  PenAddedInMainListNotifier() : super(true);

  void penAddInMainList() {
    state = false;
  }

  void penRemoveFromMainList() {
    state = true;
  }
}
