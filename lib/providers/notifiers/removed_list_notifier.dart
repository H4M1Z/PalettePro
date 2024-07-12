import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';

class RemovedListNotifier extends StateNotifier<List<PaintModel>> {
  RemovedListNotifier() : super([]);

  void addRemovedPaint(PaintModel paint) {
    state.add(paint);
    state = [...state];
  }

  void removeLastPaint() {
    state.removeLast();
    state = [...state];
  }

  void addListToOffsetsList(List<Offset> list) {
    state.last.listOfOffsets!.add(list);
    state = [...state];
  }

  void removeListFromListOfOffsets() {
    state.last.listOfOffsets!.removeLast();
    state = [...state];
  }
}
