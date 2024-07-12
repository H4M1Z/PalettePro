import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';
import 'package:white_board/providers/notifiers/paint_values_notifier.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/more_options.dart';

class ShapesOptions extends ConsumerStatefulWidget {
  const ShapesOptions(
      {super.key,
      required this.iconSize,
      required this.controller,
      required this.animation});
  final double iconSize;
  final AnimationController controller;
  final Animation<double> animation;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShapesOptionsState();
}

class _ShapesOptionsState extends ConsumerState<ShapesOptions> {
  late final PaintValues paintValuesObject;
  @override
  void initState() {
    super.initState();
    paintValuesObject = ref.read(paintValuesProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Positioned(
      top: height * 0.17,
      left: width * 0.1,
      child: MoreOptions(
        onFirstOptionTap: _onPentagonTap,
        onSecondOptionTap: _onHexagonTap,
        onThirdOptionTap: _onSquareTap,
        onFourthOptionTap: _onTriangleTap,
        firstIcon: Icon(
          Icons.pentagon_outlined,
          size: widget.iconSize,
        ),
        secondIcon: Icon(
          Icons.hexagon_outlined,
          size: widget.iconSize,
        ),
        thirdIcon: Icon(
          Icons.square_outlined,
          size: widget.iconSize,
        ),
        fourthIcon: Icon(
          Icons.change_history_outlined,
          size: widget.iconSize,
        ),
        animation: widget.animation,
      ),
    );
  }

  void _onPentagonTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.pentagon,
      stroke: null
    ));
    widget.controller.reverse();
  }

  void _onHexagonTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.hexagon,
      stroke: null
    ));
    widget.controller.reverse();
  }

  void _onSquareTap() {
    paintValuesObject.changePaint(
        (color: null, currentSelection: CurrentSelection.square, stroke: null));
    widget.controller.reverse();
  }

  void _onTriangleTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.triangle,
      stroke: null
    ));
    widget.controller.reverse();
  }
}
