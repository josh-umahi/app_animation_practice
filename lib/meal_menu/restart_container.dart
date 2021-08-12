import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

class RestartContainer extends StatelessWidget {
  final VoidCallback onButtonClick;
  final bool useRotateTween;

  const RestartContainer(
    this.onButtonClick, {
    this.useRotateTween = true,
  });

  @override
  Widget build(BuildContext context) {
    final tween = useRotateTween
        ? Tween(begin: -pi / 2, end: -5 * pi / 2)
        : Tween(begin: -pi / 2, end: -pi / 2);

    return SafeArea(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 52),
        child: FloatingActionButton(
          onPressed: onButtonClick,
          backgroundColor: Constants.primaryColor,
          child: TweenAnimationBuilder(
            tween: tween,
            duration: Constants.launchAnimationDuration,
            child: Icon(
              Icons.restart_alt_rounded,
              color: Colors.white,
              size: 30,
            ),
            builder: (_, double angle, child) {
              return Transform.rotate(
                angle: angle,
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}
