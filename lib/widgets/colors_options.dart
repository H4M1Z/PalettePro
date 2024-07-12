import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/notifiers/paint_values_notifier.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/more_options.dart';

class ColorsOptions extends ConsumerStatefulWidget {
  const ColorsOptions({
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

class _ShapesOptionsState extends ConsumerState<ColorsOptions> {
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
      top: height * 0.295,
      left: width * 0.1,
      child: MoreOptions(
        onFirstOptionTap: _onBlackColorTap,
        onSecondOptionTap: _onYellowColorTap,
        onThirdOptionTap: _onGreenColorTap,
        onFourthOptionTap: _onBrownColorTap,
        firstIcon: Icon(
          Icons.circle,
          size: widget.iconSize,
          color: Colors.black,
        ),
        secondIcon: Icon(
          Icons.circle,
          size: widget.iconSize,
          color: Colors.yellow,
        ),
        thirdIcon: Icon(
          Icons.circle,
          size: widget.iconSize,
          color: Colors.green,
        ),
        fourthIcon: Icon(
          Icons.circle,
          size: widget.iconSize,
          color: Colors.brown,
        ),
        animation: widget.animation,
      ),
    );
  }

  void _onBlackColorTap() {
    paintValuesObject.changePaint(
        (color: Colors.black, currentSelection: null, stroke: null));
    widget.controller.reverse();
    widget.penFunction();
  }

  void _onYellowColorTap() {
    paintValuesObject.changePaint(
        (color: Colors.yellow, currentSelection: null, stroke: null));
    widget.controller.reverse();
    widget.penFunction();
  }

  void _onGreenColorTap() {
    paintValuesObject.changePaint(
        (color: Colors.green, currentSelection: null, stroke: null));
    widget.controller.reverse();
    widget.penFunction();
  }

  void _onBrownColorTap() {
    paintValuesObject.changePaint(
        (color: Colors.brown, currentSelection: null, stroke: null));
    widget.controller.reverse();
    widget.penFunction();
  }
}
