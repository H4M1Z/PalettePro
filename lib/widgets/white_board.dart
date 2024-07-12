import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/custom_painters/white_board_painter.dart';
import 'package:white_board/providers/providers.dart';

class WhiteBoard extends ConsumerWidget {
  const WhiteBoard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(numberOfDrawingsProvider);
    ref.watch(paintProvider);
    return CustomPaint(
      painter: WhiteBoardPainter(
          listOfPaints: ref.read(paintProvider),
          numberOfTimesToDraw: ref.read(numberOfDrawingsProvider)),
      size: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
    );
  }
}
