import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberOfLinesNotifier extends StateNotifier<int> {
  NumberOfLinesNotifier() : super(0);

  void increaseNumberOfDrawings() {
    state++;
  }

  void decreaseNumberOfDrawings() {
    state--;
  }
}
