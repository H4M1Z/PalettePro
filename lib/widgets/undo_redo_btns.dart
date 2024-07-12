import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';

import 'package:white_board/providers/providers.dart';

class UndoRedo extends ConsumerWidget {
  const UndoRedo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(removedPaintsProvider);
    return ButtonBar(
      children: [
        IconButton(
            onPressed: () {
              _undo(ref);
            },
            icon: const Icon(Icons.undo_rounded)),
        IconButton(
            onPressed: () {
              _redo(ref);
            },
            icon: const Icon(Icons.redo_rounded)),
      ],
    );
  }

  //Undo main function
  void _undo(WidgetRef ref) {
    if (ref.read(paintProvider).isNotEmpty) {
      if (ref.read(paintProvider).last.listOfOffsets != null) {
        //pehli baar naya object dena hay jis mein list of offsets zero houn
        // is ko kahin true karwana hay warna masla a raha
        if (ref.read(removedPaintsPenObjectProvider)) {
          _createPenObjectInRemovedCache(ref);
          ref
              .read(removedPaintsPenObjectProvider.notifier)
              .addInRemovedChache();
        }

        if (ref.read(paintProvider).last.listOfOffsets!.isNotEmpty) {
          // jo naya object banay hay us meein list ko add krwana hay
          _addListInRemovedChacheOffsetsList(ref);
          // puranay object ki list mein say list ko remove krtay rehna hay
          _removeListFromMainOffsetsList(ref);
          ref
              .read(numberOfDrawingsProvider.notifier)
              .decreaseNumberOfDrawings();
          if (ref.read(paintProvider).last.listOfOffsets!.isEmpty) {
            _removePenObjectFromMainList(ref);
          }
        }
      } else {
        _addOthersInRemovedAndRemoveOthersFromMain(ref);
        ref.read(numberOfDrawingsProvider.notifier).decreaseNumberOfDrawings();
      }
    }
  }

  //undo sub functions
  void _createPenObjectInRemovedCache(WidgetRef ref) {
    ref.read(removedPaintsProvider.notifier).addRemovedPaint(PaintModel(
        selection: CurrentSelection.pen,
        color: ref.read(paintProvider).last.color,
        stroke: ref.read(paintProvider).last.stroke,
        listOfOffsets: []));
    log('object created in removed chache');
  }

  void _addListInRemovedChacheOffsetsList(WidgetRef ref) {
    ref
        .read(removedPaintsProvider.notifier)
        .addListToOffsetsList(ref.read(paintProvider).last.listOfOffsets!.last);
  }

  void _removeListFromMainOffsetsList(WidgetRef ref) {
    ref.read(paintProvider.notifier).removeListfromOffsetsList();
  }

  void _removePenObjectFromMainList(WidgetRef ref) {
    ref.read(paintProvider.notifier).removePaint();
    ref.read(penListProvider.notifier).listIsRemoved();
    ref.read(removedPaintsPenObjectProvider.notifier).removeFromRemovedChache();
    log('pen object removed form main list');
  }

  void _addOthersInRemovedAndRemoveOthersFromMain(WidgetRef ref) {
    ref
        .read(removedPaintsProvider.notifier)
        .addRemovedPaint(ref.read(paintProvider).last);
    ref.read(paintProvider.notifier).removePaint();
  }

  //Redo main function
  void _redo(WidgetRef ref) {
    if (ref.read(removedPaintsProvider).isNotEmpty) {
      if (ref.read(removedPaintsProvider).last.listOfOffsets != null) {
        if (ref.read(paintPenObjectProvider)) {
          _createPenObjectInMainList(ref);
          ref.read(paintPenObjectProvider.notifier).penAddInMainList();
        }

        if (ref.read(removedPaintsProvider).last.listOfOffsets!.isNotEmpty) {
          _addListToMainObjectOffsetsList(ref);
          _removeListFromRemovedObjectOffsetsList(ref);

          ref
              .read(numberOfDrawingsProvider.notifier)
              .increaseNumberOfDrawings();
          if (ref.read(removedPaintsProvider).last.listOfOffsets!.isEmpty) {
            _removePenObjectFromRemovedCache(ref);
          }
        }
      } else {
        _addOthersInMainAndRemoveOthersFromRemovedCahche(ref);
        ref.read(numberOfDrawingsProvider.notifier).increaseNumberOfDrawings();
      }
    }
  }

  //Redo sub Functions
  void _createPenObjectInMainList(WidgetRef ref) {
    log('object created in main list');
    ref.read(paintProvider.notifier).addPaint(PaintModel(
        selection: CurrentSelection.pen,
        color: ref.read(removedPaintsProvider).last.color,
        stroke: ref.read(removedPaintsProvider).last.stroke,
        listOfOffsets: []));
  }

  void _addListToMainObjectOffsetsList(WidgetRef ref) {
    ref.read(paintProvider.notifier).addListToOffsetsList(
        ref.read(removedPaintsProvider).last.listOfOffsets!.last);
  }

  void _removeListFromRemovedObjectOffsetsList(WidgetRef ref) {
    ref.read(removedPaintsProvider.notifier).removeListFromListOfOffsets();
  }

  void _removePenObjectFromRemovedCache(WidgetRef ref) {
    log('object removed from cahche list');
    ref.read(removedPaintsProvider.notifier).removeLastPaint();
    ref.read(penListProvider.notifier).listIsCreated();
    ref.read(paintPenObjectProvider.notifier).penRemoveFromMainList();
    // yahan shyd ksii ko true krwana hay
  }

  void _addOthersInMainAndRemoveOthersFromRemovedCahche(WidgetRef ref) {
    ref
        .read(paintProvider.notifier)
        .addPaint(ref.read(removedPaintsProvider).last);

    ref.read(removedPaintsProvider.notifier).removeLastPaint();
  }
}
