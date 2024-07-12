import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';

class PaintValues extends StateNotifier<
    ({CurrentSelection? currentSelection, Color? color, double? stroke})> {
  CurrentSelection _currentSelection = CurrentSelection.line;
  Color _currentColor = Colors.black;
  double _currentStroke = 5.0;
  PaintValues()
      : super((
          currentSelection: CurrentSelection.line,
          color: Colors.black,
          stroke: 5.0
        ));

  ({
    Color? color,
    CurrentSelection? currentSelection,
    double? stroke
  })? _newValuesRecord;

  void changePaint(
      ({
        CurrentSelection? currentSelection,
        Color? color,
        double? stroke
      }) paintValues) {
    _newValuesRecord = (
      color: paintValues.color == null
          ? _currentColor
          : _currentColor = paintValues.color!,
      currentSelection: paintValues.currentSelection == null
          ? _currentSelection
          : _currentSelection = paintValues.currentSelection!,
      stroke: paintValues.stroke == null
          ? _currentStroke
          : _currentStroke = paintValues.stroke!
    );
    state = _newValuesRecord!;
  }
}
