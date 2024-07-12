import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';
import 'package:white_board/providers/notifiers/paint_values_notifier.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/more_options.dart';

class StrokeOptions extends ConsumerStatefulWidget {
  const StrokeOptions({
    super.key,
    required this.iconSize,
    required this.controller,
    required this.animation,
    required this.penFunction,
  });
  final double iconSize;
  final AnimationController controller;
  final Animation<double> animation;
  final VoidCallback penFunction;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShapesOptionsState();
}

class _ShapesOptionsState extends ConsumerState<StrokeOptions> {
  late final PaintValues paintValuesObject;
  late final List<PaintModel> listOfPaints;
  @override
  void initState() {
    super.initState();
    paintValuesObject = ref.read(paintValuesProvider.notifier);
    listOfPaints = ref.read(paintProvider);
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Positioned(
      top: height * 0.23,
      left: width * 0.1,
      child: MoreOptions(
        onFirstOptionTap: _onFirstStrokeClick,
        onSecondOptionTap: _onSecondStrokeClick,
        onThirdOptionTap: _onThirdStrokeClick,
        onFourthOptionTap: _onFourthStrokeClick,
        firstIcon: Icon(
          Icons.circle,
          size: widget.iconSize - 9,
          color: Colors.black54,
        ),
        secondIcon: Icon(
          Icons.circle,
          size: widget.iconSize - 7,
          color: Colors.black54,
        ),
        thirdIcon: Icon(
          Icons.circle,
          size: widget.iconSize - 5,
          color: Colors.black54,
        ),
        fourthIcon: Icon(
          Icons.circle,
          size: widget.iconSize,
          color: Colors.black54,
        ),
        animation: widget.animation,
      ),
    );
  }

  void _onFirstStrokeClick() {
    paintValuesObject
        .changePaint((color: null, currentSelection: null, stroke: 5.0));
    widget.controller.reverse();
    widget.penFunction();
  }

  void _onSecondStrokeClick() {
    paintValuesObject
        .changePaint((color: null, currentSelection: null, stroke: 11.0));
    widget.controller.reverse();
    widget.penFunction();
  }

  void _onThirdStrokeClick() {
    paintValuesObject
        .changePaint((color: null, currentSelection: null, stroke: 14.0));
    widget.controller.reverse();
    widget.penFunction();
  }

  void _onFourthStrokeClick() {
    paintValuesObject
        .changePaint((color: null, currentSelection: null, stroke: 17.0));
    widget.controller.reverse();
    widget.penFunction();
  }
}
