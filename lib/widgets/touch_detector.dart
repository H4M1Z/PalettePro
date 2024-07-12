import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/white_board.dart';

class TouchDetector extends ConsumerWidget {
  const TouchDetector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(paintValuesProvider);
    ref.watch(startingOffsetProvider);
    ref.watch(penListProvider);
    return GestureDetector(
      onPanStart: (details) {
        addNewPaint(ref, details);
        ref.read(numberOfDrawingsProvider.notifier).increaseNumberOfDrawings();
      },
      onPanUpdate: (details) {
        modifyOffsets(ref, details);
      },
      child: const WhiteBoard(),
    );
  }

  void addNewPaint(WidgetRef ref, DragStartDetails details) {
    return switch (ref.read(paintValuesProvider).currentSelection) {
      CurrentSelection.pen => addPen(ref),
      _ => addShape(ref, details)
    };
  }

  void addPen(WidgetRef ref) {
    if (ref.read(penListProvider)) {
      ref.read(paintProvider.notifier).addNewlistToOffsetsList();
    } else {
      ref.read(paintProvider.notifier).addPaint(PaintModel(
          selection: CurrentSelection.pen,
          color: ref.read(paintValuesProvider).color!,
          stroke: ref.read(paintValuesProvider).stroke!,
          listOfOffsets: [[]]));
      ref.read(penListProvider.notifier).listIsCreated();
      log('pen object created');
    }
  }

  void addShape(WidgetRef ref, DragStartDetails details) {
    ref.read(penListProvider.notifier).listIsRemoved();
    ref.read(paintProvider.notifier).addPaint(
          PaintModel(
            selection: ref.read(paintValuesProvider).currentSelection!,
            color: ref.read(paintValuesProvider).color!,
            stroke: ref.read(paintValuesProvider).stroke!,
            startingOffset: details.globalPosition,
            endingOffset: endingOffset(ref, details),
          ),
        );
    ref
        .read(startingOffsetProvider.notifier)
        .newStartingOffset(details.globalPosition);
    log('other object is created');
  }

  Offset? endingOffset(WidgetRef ref, DragStartDetails details) {
    return switch (ref.read(paintValuesProvider).currentSelection) {
      CurrentSelection.line =>
        Offset(details.globalPosition.dx, details.globalPosition.dy),
      CurrentSelection.triangle => Offset(0, details.globalPosition.dy),
      _ => Offset.zero
    };
  }

  void modifyOffsets(WidgetRef ref, DragUpdateDetails details) {
    final Offset offset;
    switch (ref.read(paintValuesProvider).currentSelection) {
      case CurrentSelection.pen:
        ref
            .read(paintProvider.notifier)
            .addOffsetsToList(details.globalPosition);
        break;
      case CurrentSelection.line:
        offset = Offset(details.globalPosition.dx, details.globalPosition.dy);
        ref.read(paintProvider.notifier).modifyEndingOffset(offset);
        break;
      case CurrentSelection.triangle:
        offset = Offset(
            details.globalPosition.dx - ref.read(startingOffsetProvider).dx,
            details.globalPosition.dy);
        ref.read(paintProvider.notifier).modifyEndingOffset(offset);
        break;
      default:
        offset = Offset(
            details.globalPosition.dx - ref.read(startingOffsetProvider).dx,
            details.globalPosition.dy - ref.read(startingOffsetProvider).dy);
        ref.read(paintProvider.notifier).modifyEndingOffset(offset);
    }
  }
}
