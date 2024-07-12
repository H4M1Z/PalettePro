import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/arrows_options.dart';
import 'package:white_board/widgets/colors_options.dart';
import 'package:white_board/widgets/options_container.dart';
import 'package:white_board/widgets/shape_options.dart';
import 'package:white_board/widgets/stroke_options.dart';
import 'package:white_board/widgets/touch_detector.dart';

class CanvasDrawer extends ConsumerStatefulWidget {
  const CanvasDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CanvasDrawerState();
}

class _CanvasDrawerState extends ConsumerState<CanvasDrawer>
    with TickerProviderStateMixin {
  late final AnimationController _animationControllerForShapes;
  late final AnimationController _animationControllerForStroke;
  late final AnimationController _animationControllerForColors;
  late final AnimationController _animationControllerForArrows;

  late final Animation<double> animationForShapes;
  late final Animation<double> animationForStroke;
  late final Animation<double> animationForColors;
  late final Animation<double> animationForArrows;

  final tweenForAnimation = Tween<double>(begin: 0.0, end: 1.0);

  static const iconSize = 20.0;

  @override
  void initState() {
    super.initState();

    //initialize controllers
    _animationControllerForShapes = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationControllerForStroke = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationControllerForColors = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationControllerForArrows = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    animationForShapes =
        tweenForAnimation.animate(_animationControllerForShapes);
    animationForStroke =
        tweenForAnimation.animate(_animationControllerForStroke);
    animationForColors =
        tweenForAnimation.animate(_animationControllerForColors);
    animationForArrows =
        tweenForAnimation.animate(_animationControllerForArrows);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(paintProvider);
    return SizedBox.expand(
      child: Stack(children: [
        const TouchDetector(),
        ShapesOptions(
            iconSize: iconSize,
            controller: _animationControllerForShapes,
            animation: animationForShapes),
        StrokeOptions(
            iconSize: iconSize,
            controller: _animationControllerForStroke,
            animation: animationForStroke,
            penFunction: _changeValuesOfPen),
        ColorsOptions(
            iconSize: iconSize,
            controller: _animationControllerForColors,
            animation: animationForColors,
            penFunction: _changeValuesOfPen),
        ArrowsOptions(
            iconSize: iconSize,
            controller: _animationControllerForArrows,
            animation: animationForArrows),
        Options(
          controllerForShapes: _animationControllerForShapes,
          controllerForStroke: _animationControllerForStroke,
          controllerForColors: _animationControllerForColors,
          controllerForArrows: _animationControllerForArrows,
        ),
      ]),
    );
  }

  void _changeValuesOfPen() {
    log(ref.read(paintProvider).last.listOfOffsets.toString());
    if (ref.read(paintProvider).last.listOfOffsets != null) {
      ref.read(penListProvider.notifier).listIsRemoved();
    }
  }
}
