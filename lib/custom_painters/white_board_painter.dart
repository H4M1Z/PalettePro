import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:white_board/model_classes/paint_model.dart';

class WhiteBoardPainter extends CustomPainter {
  WhiteBoardPainter(
      {required this.listOfPaints, required this.numberOfTimesToDraw});

  final List<PaintModel> listOfPaints;
  final int numberOfTimesToDraw;
  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < numberOfTimesToDraw; i++) {
      //currentSelection
      var selection = listOfPaints[i].selection;
      //paint
      var paint = Paint()
        ..color = listOfPaints[i].color
        ..strokeWidth = listOfPaints[i].stroke
        ..strokeJoin = StrokeJoin.miter
        ..style = PaintingStyle.stroke;

      if (selection == CurrentSelection.pen) {
        for (var j = 0; j < listOfPaints[i].listOfOffsets!.length; j++) {
          try {
            canvas.drawPoints(
                PointMode.polygon, listOfPaints[i].listOfOffsets![j], paint);
          } catch (e) {
            log(e.toString());
          }
        }
      } else if (selection == CurrentSelection.line) {
        canvas.drawLine(listOfPaints[i].startingOffset!,
            listOfPaints[i].endingOffset!, paint);
      } else {
        drawRespectiveShape(listOfPaints[i], selection, canvas, paint);
      }
    }
  }

  @override
  bool shouldRepaint(WhiteBoardPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WhiteBoardPainter oldDelegate) => true;

  void drawRespectiveShape(PaintModel paintModel, CurrentSelection selection,
      Canvas canvas, Paint paint) {
    final rectangle = Rect.fromLTWH(
        paintModel.startingOffset!.dx,
        paintModel.startingOffset!.dy,
        paintModel.endingOffset!.dx,
        paintModel.endingOffset!.dy);

    switch (selection) {
      case CurrentSelection.pentagon:
        drawpentagon(rectangle, canvas, paint);
        break;
      case CurrentSelection.hexagon:
        drawHexagon(rectangle, canvas, paint);
        break;
      case CurrentSelection.square:
        drawSquare(rectangle, canvas, paint);
        break;
      case CurrentSelection.triangle:
        drawTriangle(rectangle, canvas, paint);
        break;
      case CurrentSelection.upArrow:
        drawUpArrow(rectangle, canvas, paint);
        break;
      case CurrentSelection.downArrow:
        drawDownArrow(rectangle, canvas, paint);
        break;
      case CurrentSelection.leftArrow:
        drawLeftArrow(rectangle, canvas, paint);
        break;
      default:
        drawRightArrow(rectangle, canvas, paint);
    }
  }

  void drawpentagon(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.topCenter.dx, rectangle.topCenter.dy)
      ..lineTo(rectangle.centerLeft.dx, rectangle.centerLeft.dy)
      ..lineTo(rectangle.bottomCenter.dx - rectangle.width * 0.2,
          rectangle.bottomCenter.dy)
      ..lineTo(rectangle.bottomCenter.dx + rectangle.width * 0.2,
          rectangle.bottomCenter.dy)
      ..lineTo(rectangle.centerRight.dx, rectangle.centerRight.dy)
      ..lineTo(rectangle.topCenter.dx, rectangle.topCenter.dy);
    canvas.drawPath(path, paint);
  }

  void drawHexagon(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.topCenter.dx - rectangle.width * 0.2,
          rectangle.topCenter.dy)
      ..lineTo(rectangle.topCenter.dx + rectangle.width * 0.2,
          rectangle.topCenter.dy)
      ..lineTo(rectangle.centerRight.dx, rectangle.centerRight.dy)
      ..lineTo(rectangle.bottomCenter.dx + rectangle.width * 0.2,
          rectangle.bottomCenter.dy)
      ..lineTo(rectangle.bottomCenter.dx - rectangle.width * 0.2,
          rectangle.bottomCenter.dy)
      ..lineTo(rectangle.centerLeft.dx, rectangle.centerLeft.dy)
      ..lineTo(rectangle.topCenter.dx - rectangle.width * 0.2,
          rectangle.topCenter.dy);
    canvas.drawPath(path, paint);
  }

  void drawSquare(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.topLeft.dx, rectangle.topLeft.dy)
      ..lineTo(rectangle.topRight.dx, rectangle.topRight.dy)
      ..lineTo(rectangle.bottomRight.dx, rectangle.bottomRight.dy)
      ..lineTo(rectangle.bottomLeft.dx, rectangle.bottomLeft.dy)
      ..lineTo(rectangle.topLeft.dx, rectangle.topLeft.dy);
    canvas.drawPath(path, paint);
  }

  void drawTriangle(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.topCenter.dx, rectangle.topCenter.dy)
      ..lineTo(rectangle.bottomLeft.dx, rectangle.height)
      ..lineTo(rectangle.bottomRight.dx, rectangle.height)
      ..lineTo(rectangle.topCenter.dx, rectangle.topCenter.dy);
    canvas.drawPath(path, paint);
  }

  void drawUpArrow(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.topCenter.dx, rectangle.topCenter.dy)
      ..lineTo(rectangle.centerRight.dx, rectangle.centerRight.dy)
      ..lineTo(rectangle.center.dx + rectangle.width * 0.2, rectangle.center.dy)
      ..lineTo(rectangle.bottomCenter.dx + rectangle.width * 0.2,
          rectangle.bottomCenter.dy)
      ..lineTo(rectangle.bottomCenter.dx - rectangle.width * 0.2,
          rectangle.bottomCenter.dy)
      ..lineTo(rectangle.center.dx - rectangle.width * 0.2, rectangle.center.dy)
      ..lineTo(rectangle.centerLeft.dx, rectangle.centerLeft.dy)
      ..lineTo(rectangle.topCenter.dx, rectangle.topCenter.dy);
    canvas.drawPath(path, paint);
  }

  void drawDownArrow(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.topCenter.dx - rectangle.width * 0.2,
          rectangle.topCenter.dy)
      ..lineTo(rectangle.topCenter.dx + rectangle.width * 0.2,
          rectangle.topCenter.dy)
      ..lineTo(rectangle.center.dx + rectangle.width * 0.2, rectangle.center.dy)
      ..lineTo(rectangle.centerRight.dx, rectangle.centerRight.dy)
      ..lineTo(rectangle.bottomCenter.dx, rectangle.bottomCenter.dy)
      ..lineTo(rectangle.centerLeft.dx, rectangle.centerLeft.dy)
      ..lineTo(rectangle.center.dx - rectangle.width * 0.2, rectangle.center.dy)
      ..lineTo(rectangle.topCenter.dx - rectangle.width * 0.2,
          rectangle.topCenter.dy);
    canvas.drawPath(path, paint);
  }

  void drawLeftArrow(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.centerLeft.dx, rectangle.centerLeft.dy)
      ..lineTo(rectangle.topCenter.dx, rectangle.topCenter.dy)
      ..lineTo(
          rectangle.center.dx, rectangle.center.dy - rectangle.height * 0.2)
      ..lineTo(rectangle.centerRight.dx,
          rectangle.centerRight.dy - rectangle.height * 0.2)
      ..lineTo(rectangle.centerRight.dx,
          rectangle.centerRight.dy + rectangle.height * 0.2)
      ..lineTo(
          rectangle.center.dx, rectangle.center.dy + rectangle.height * 0.2)
      ..lineTo(rectangle.bottomCenter.dx, rectangle.bottomCenter.dy)
      ..lineTo(rectangle.centerLeft.dx, rectangle.centerLeft.dy);

    canvas.drawPath(path, paint);
  }

  void drawRightArrow(Rect rectangle, Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(rectangle.centerLeft.dx,
          rectangle.centerLeft.dy - rectangle.height * 0.2)
      ..lineTo(rectangle.centerLeft.dx,
          rectangle.centerLeft.dy + rectangle.height * 0.2)
      ..lineTo(
          rectangle.center.dx, rectangle.center.dy + rectangle.height * 0.2)
      ..lineTo(rectangle.bottomCenter.dx, rectangle.bottomCenter.dy)
      ..lineTo(rectangle.centerRight.dx, rectangle.centerRight.dy)
      ..lineTo(rectangle.topCenter.dx, rectangle.topCenter.dy)
      ..lineTo(
          rectangle.center.dx, rectangle.center.dy - rectangle.height * 0.2)
      ..lineTo(rectangle.centerLeft.dx,
          rectangle.centerLeft.dy - rectangle.height * 0.2);

    canvas.drawPath(path, paint);
  }
}
