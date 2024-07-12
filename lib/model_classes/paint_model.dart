// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PaintModel {
  final Offset? startingOffset;
  Offset? endingOffset;
  List<List<Offset>>? listOfOffsets;
  final CurrentSelection selection;
  Color color;
  double stroke;
  PaintModel(
      {required this.selection,
      required this.color,
      required this.stroke,
      this.startingOffset,
      this.endingOffset,
      this.listOfOffsets});

  @override
  String toString() {
    return 'PaintModel(listOfOffsets: $listOfOffsets ,  startingOffset: $startingOffset, endingOffset: $endingOffset, , selection: $selection, color: $color, stroke: $stroke)';
  }
}

enum CurrentSelection {
  pen,
  pentagon,
  hexagon,
  square,
  triangle,
  line,
  upArrow,
  downArrow,
  leftArrow,
  rightArrow,
}
