import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'tile.dart';

class FourWaySlideout extends StatefulWidget {
  @override
  _FourWaySlideoutState createState() => _FourWaySlideoutState();
}

class _FourWaySlideoutState extends State<FourWaySlideout>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 350),
      vsync: this,
    );
  }

  @override
  void dispose() {
    // * Always dispose your controllers
    animationController.dispose();
    super.dispose();
  }

  void slideIn() => animationController.reverse();

  void slideOut() => animationController.forward();

  void toggleMenu() => animationController.isCompleted ? slideIn() : slideOut();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final widthFactor = Constants.widthFactor;
    final heightFactor = Constants.heightFactor;

    /// The minumum animation controller value needed for
    /// the middle button to start animating
    final minValueForButton = 0.3;

    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, state) {
          final animationControllerValue = animationController.value;

          return Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: FittedBox(
                  child: Image.asset("assets/four_way_slideout/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              Tile(
                key: UniqueKey(),
                tilePosition: TilePosition.topLeft,
                offset: Offset(
                  animationControllerValue * -screenWidth * widthFactor,
                  animationControllerValue * -screenHeight * heightFactor,
                ),
              ),
              Tile(
                key: UniqueKey(),
                tilePosition: TilePosition.bottomLeft,
                offset: Offset(
                  animationControllerValue * -screenWidth * widthFactor,
                  animationControllerValue * screenHeight * heightFactor,
                ),
              ),
              Tile(
                key: UniqueKey(),
                tilePosition: TilePosition.topRight,
                offset: Offset(
                  animationControllerValue * screenWidth * widthFactor,
                  animationControllerValue * -screenHeight * heightFactor,
                ),
              ),
              Tile(
                key: UniqueKey(),
                tilePosition: TilePosition.bottomRight,
                offset: Offset(
                  animationControllerValue * screenWidth * widthFactor,
                  animationControllerValue * screenHeight * heightFactor,
                ),
              ),
              Transform.translate(
                offset: animationControllerValue < minValueForButton
                    ? Offset(0, 0)
                    : Offset(
                        (animationControllerValue - minValueForButton) *
                            screenHeight *
                            0.15,
                        (animationControllerValue - minValueForButton) *
                            -screenHeight *
                            0.35,
                      ),
                child: Center(
                  child: Transform.scale(
                    scale: (animationControllerValue * 0.5) + 1,
                    child: Transform.rotate(
                      angle: (animationControllerValue - 0) * (pi / 4) * 3,
                      child: FloatingActionButton(
                        onPressed: toggleMenu,
                        backgroundColor: Constants.button,
                        child: Icon(
                          Icons.close_rounded,
                          size: 27,
                          color: animationController.isCompleted
                              ? Colors.black
                              : Constants.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              animationControllerValue > 0
                  ? Transform.translate(
                      offset: Offset(
                        0,
                        (130 * animationControllerValue) + 70,
                      ),
                      child: Center(
                        child: Text(
                          "Hey   there 👋",
                          style: GoogleFonts.monoton(
                            color: Colors.white
                                .withOpacity(animationControllerValue),
                            fontSize: 43,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
