import 'dart:developer';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';

class PaintNotifier extends StateNotifier<List<PaintModel>> {
  PaintNotifier() : super([]);

  void addPaint(PaintModel paint) {
    state.add(paint);
    state = [...state];
  }

  void modifyEndingOffset(Offset offset) {
    state[state.length - 1].endingOffset = offset;
    state = [...state];
  }

  void removePaint() {
    state.removeLast();
    state = [...state];
  }

  void addNewlistToOffsetsList() {
    try {
      state.last.listOfOffsets!.add([]);
      state = [...state];
    } catch (e) {
      log(e.toString());
    }
  }

  void addOffsetsToList(Offset offset) {
    try {
      state.last.listOfOffsets![state.last.listOfOffsets!.length - 1]
          .add(offset);
      state = [...state];
    } catch (e) {
      log(e.toString());
    }
  }

  void removeListfromOffsetsList() {
    state.last.listOfOffsets!.removeLast();
    state = [...state];
  }

  void addListToOffsetsList(List<Offset> list) {
    state.last.listOfOffsets!.add(list);
    state = [...state];
  }

  void changeValuesOfPen(Color color, double stroke) {
    state.last.color = color;
    state.last.stroke = stroke;
    state = [...state];
  }
}
