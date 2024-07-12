import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/model_classes/paint_model.dart';
import 'package:white_board/providers/providers.dart';
import 'package:white_board/widgets/my_icon_btn.dart';

class Options extends ConsumerStatefulWidget {
  const Options(
      {super.key,
      required this.controllerForShapes,
      required this.controllerForStroke,
      required this.controllerForColors,
      required this.controllerForArrows});
  final AnimationController controllerForShapes,
      controllerForStroke,
      controllerForColors,
      controllerForArrows;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OptionsState();
}

class _OptionsState extends ConsumerState<Options> {
  static const pen = 'pen';
  static const shapes = 'Shapes';
  static const stroke = 'Stroke';
  static const colors = 'Colors';
  static const arrows = 'Arrows';
  static const line = 'Line';

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Positioned(
        top: height * 0.1,
        child: Container(
          width: width * 0.1,
          height: height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(
                    2,
                    2,
                  )),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: MyIconButton(
                    btnText: pen,
                    icon: Icons.edit,
                    onTap: _onPenTap,
                  )),
              Expanded(
                  flex: 1,
                  child: MyIconButton(
                    btnText: shapes,
                    icon: Icons.category,
                    onTap: _onShapesTap,
                  )),
              Expanded(
                  flex: 1,
                  child: MyIconButton(
                    btnText: stroke,
                    icon: Icons.border_color_outlined,
                    onTap: _onStrokeTap,
                  )),
              Expanded(
                  flex: 1,
                  child: MyIconButton(
                    btnText: colors,
                    icon: Icons.palette_outlined,
                    onTap: _onColorsTap,
                  )),
              Expanded(
                  flex: 1,
                  child: MyIconButton(
                    btnText: arrows,
                    icon: Icons.open_with_outlined,
                    onTap: _onArrowsTap,
                  )),
              Expanded(
                  flex: 1,
                  child: MyIconButton(
                    btnText: line,
                    icon: Icons.maximize_outlined,
                    onTap: _onLineTap,
                  )),
            ],
          ),
        ));
  }

  void _onPenTap() {
    ref.read(paintValuesProvider.notifier).changePaint(
        (color: null, currentSelection: CurrentSelection.pen, stroke: null));
  }

  void _onShapesTap() {
    if (widget.controllerForShapes.isCompleted) {
      widget.controllerForShapes.reverse();
    } else {
      widget.controllerForShapes.forward();
    }
  }

  void _onStrokeTap() {
    if (widget.controllerForStroke.isCompleted) {
      widget.controllerForStroke.reverse();
    } else {
      widget.controllerForStroke.forward();
    }
  }

  void _onColorsTap() {
    if (widget.controllerForColors.isCompleted) {
      widget.controllerForColors.reverse();
    } else {
      widget.controllerForColors.forward();
    }
  }

  void _onArrowsTap() {
    if (widget.controllerForArrows.isCompleted) {
      widget.controllerForArrows.reverse();
    } else {
      widget.controllerForArrows.forward();
    }
  }

  void _onLineTap() {
    ref.read(paintValuesProvider.notifier).changePaint(
        (color: null, currentSelection: CurrentSelection.line, stroke: null));
  }
}
