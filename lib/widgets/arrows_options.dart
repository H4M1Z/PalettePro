import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';
import 'package:white_board/providers/notifiers/paint_values_notifier.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/more_options.dart';

class ArrowsOptions extends ConsumerStatefulWidget {
  const ArrowsOptions(
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

class _ShapesOptionsState extends ConsumerState<ArrowsOptions> {
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
      top: height * 0.355,
      left: width * 0.1,
      child: MoreOptions(
        onFirstOptionTap: _onUpArrowTap,
        onSecondOptionTap: _onDownArrowTap,
        onThirdOptionTap: _onLeftArrrowTap,
        onFourthOptionTap: _onRightArrowTap,
        firstIcon: Icon(
          Icons.arrow_upward_outlined,
          size: widget.iconSize,
        ),
        secondIcon: Icon(
          Icons.arrow_downward_outlined,
          size: widget.iconSize,
        ),
        thirdIcon: Icon(
          Icons.arrow_back,
          size: widget.iconSize,
        ),
        fourthIcon: Icon(
          Icons.arrow_forward_outlined,
          size: widget.iconSize,
        ),
        animation: widget.animation,
      ),
    );
  }

  void _onUpArrowTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.upArrow,
      stroke: null
    ));
    widget.controller.reverse();
  }

  void _onDownArrowTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.downArrow,
      stroke: null
    ));
    widget.controller.reverse();
  }

  void _onLeftArrrowTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.leftArrow,
      stroke: null
    ));
    widget.controller.reverse();
  }

  void _onRightArrowTap() {
    paintValuesObject.changePaint((
      color: null,
      currentSelection: CurrentSelection.rightArrow,
      stroke: null
    ));
    widget.controller.reverse();
  }
}
