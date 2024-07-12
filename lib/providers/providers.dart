import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';
import 'package:white_board/providers/notifiers/pen_added_in_main_list_notifier.dart';
import 'package:white_board/providers/notifiers/pen_added_in_removed_notidier.dart';
import 'package:white_board/providers/notifiers/number_of_drawings_notifier.dart';
import 'package:white_board/providers/notifiers/paint_notifier.dart';
import 'package:white_board/providers/notifiers/pen_list_notifier.dart';
import 'package:white_board/providers/notifiers/removed_list_notifier.dart';
import 'package:white_board/providers/notifiers/paint_values_notifier.dart';
import 'package:white_board/providers/notifiers/starting_offset_notifier.dart';

final numberOfDrawingsProvider =
    StateNotifierProvider<NumberOfLinesNotifier, int>((ref) {
  return NumberOfLinesNotifier();
});

final paintProvider =
    StateNotifierProvider<PaintNotifier, List<PaintModel>>((ref) {
  return PaintNotifier();
});

final paintValuesProvider = StateNotifierProvider<
    PaintValues,
    ({
      CurrentSelection? currentSelection,
      Color? color,
      double? stroke
    })>((ref) {
  return PaintValues();
});

final removedPaintsProvider =
    StateNotifierProvider<RemovedListNotifier, List<PaintModel>>((ref) {
  return RemovedListNotifier();
});

final startingOffsetProvider =
    StateNotifierProvider<StartingOffsetNotifier, Offset>((ref) {
  return StartingOffsetNotifier();
});

final penListProvider = StateNotifierProvider<PenListNotifier, bool>((ref) {
  return PenListNotifier();
});

final removedPaintsPenObjectProvider =
    StateNotifierProvider<PenAddedInRemovedChache, bool>((ref) {
  return PenAddedInRemovedChache();
});

final paintPenObjectProvider =
    StateNotifierProvider<PenAddedInMainListNotifier, bool>((ref) {
  return PenAddedInMainListNotifier();
});
