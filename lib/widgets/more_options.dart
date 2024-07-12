import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreOptions extends ConsumerWidget {
  const MoreOptions(
      {super.key,
      required this.onFirstOptionTap,
      required this.onSecondOptionTap,
      required this.onThirdOptionTap,
      required this.onFourthOptionTap,
      required this.firstIcon,
      required this.secondIcon,
      required this.thirdIcon,
      required this.fourthIcon,
      required this.animation});
  final VoidCallback onFirstOptionTap,
      onSecondOptionTap,
      onThirdOptionTap,
      onFourthOptionTap;
  final Widget firstIcon, secondIcon, thirdIcon, fourthIcon;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizeTransition(
      axis: Axis.horizontal,
      sizeFactor: animation,
      child: Container(
        width: width * 0.3,
        height: height * 0.05,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(
            3,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: onFirstOptionTap,
                  child: firstIcon,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: GestureDetector(
                onTap: onSecondOptionTap,
                child: secondIcon,
              )),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: GestureDetector(
                onTap: onThirdOptionTap,
                child: thirdIcon,
              )),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: GestureDetector(
                onTap: onFourthOptionTap,
                child: fourthIcon,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
