import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'models.dart';
import 'tile_container.dart';

class MealMenu extends StatefulWidget {
  final Widget restartContainer;
  final Function(Offset startOffset, MenuTile menuTile)? onTIleClick;
  MealMenu({
    required this.restartContainer,
    required this.onTIleClick,
  });

  @override
  _MealMenuState createState() => _MealMenuState();
}

class _MealMenuState extends State<MealMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Constants.launchAnimationDuration,
      vsync: this,
    );
    slideEntry();
  }

  @override
  void dispose() {
    // * Always dispose your controllers
    animationController.dispose();
    super.dispose();
  }

  void slideEntry() => animationController.forward();

  Widget build(BuildContext context) {
    final tileWidth = MediaQuery.of(context).size.width / 2 - 10;
    final row2TilesOffsetXDelay = 60.0;
    final row3TilesOffsetXDelay = row2TilesOffsetXDelay * 2;
    final row3IconsOffsetXDelay = row3TilesOffsetXDelay * 2;
    final iconRotatePi = 5 * pi / 6;

    return Scaffold(
      backgroundColor: Constants.initialBgColor,
      body: AnimatedBuilder(
        animation: CurvedAnimation(
          curve: Curves.easeInOut,
          parent: animationController,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.restartContainer,
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.leftPadding,
                bottom: Constants.leftPadding + 5,
              ),
              child: Text(
                "Select a meal",
                style: Constants.textStyle(30).copyWith(height: 0),
              ),
            ),
          ],
        ),
        builder: (context, child) {
          final animationControllerValue = animationController.value;

          final row1Col1TileOffsetX =
              (tileWidth * animationControllerValue) - tileWidth;
          final row2Col1TileOffsetX =
              ((tileWidth + row2TilesOffsetXDelay) * animationControllerValue) -
                  (row2TilesOffsetXDelay + tileWidth);
          final row3Col1TileOffsetX =
              ((tileWidth + row3TilesOffsetXDelay) * animationControllerValue) -
                  (row3TilesOffsetXDelay + tileWidth);
          final row1Col2TileOffsetX = -row1Col1TileOffsetX;
          final row2Col2TileOffsetX = -row2Col1TileOffsetX;
          final row3Col2TileOffsetX = -row3Col1TileOffsetX;

          final row1Col1IconOffsetX = -row2Col2TileOffsetX;
          final row2Col1IconOffsetX = -row3Col2TileOffsetX;
          final row3Col1IconOffsetX =
              ((tileWidth + row3IconsOffsetXDelay) * animationControllerValue) -
                  (row3IconsOffsetXDelay + tileWidth);
          final row1Col2IconOffsetX = -row1Col1IconOffsetX;
          final row2Col2IconOffsetX = -row2Col1IconOffsetX;
          final row3Col2IconOffsetX = -row3Col1IconOffsetX;

          final rightIconsRotate =
              -(iconRotatePi * animationControllerValue - iconRotatePi);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child!,
              TileRow(
                tiles: [
                  TileContainer(
                    MenuTile(
                      width: tileWidth,
                      position: TilePosition.Row1Col1,
                      offsetX: row1Col1TileOffsetX,
                      iconAngle: 0,
                      iconOffset: Offset(
                        row1Col1IconOffsetX,
                        0,
                      ),
                      isOnLeft: true,
                      onTap: widget.onTIleClick,
                    ),
                  ),
                  TileContainer(
                    MenuTile(
                      width: tileWidth,
                      position: TilePosition.Row1Col2,
                      offsetX: row1Col2TileOffsetX,
                      iconAngle: rightIconsRotate,
                      iconOffset: Offset(
                        row1Col2IconOffsetX,
                        0,
                      ),
                      isOnLeft: false,
                      onTap: widget.onTIleClick,
                    ),
                  ),
                ],
              ),
              TileRow(
                tiles: [
                  TileContainer(
                    MenuTile(
                      width: tileWidth,
                      position: TilePosition.Row2Col1,
                      offsetX: row2Col1TileOffsetX,
                      iconAngle: 0,
                      iconOffset: Offset(
                        row2Col1IconOffsetX,
                        0,
                      ),
                      isOnLeft: true,
                      onTap: widget.onTIleClick,
                    ),
                  ),
                  TileContainer(
                    MenuTile(
                      width: tileWidth,
                      position: TilePosition.Row2Col2,
                      offsetX: row2Col2TileOffsetX,
                      iconAngle: rightIconsRotate,
                      iconOffset: Offset(
                        row2Col2IconOffsetX,
                        0,
                      ),
                      isOnLeft: false,
                      onTap: widget.onTIleClick,
                    ),
                  ),
                ],
              ),
              TileRow(
                tiles: [
                  TileContainer(
                    MenuTile(
                      width: tileWidth,
                      position: TilePosition.Row3Col1,
                      offsetX: row3Col1TileOffsetX,
                      iconAngle: 0,
                      iconOffset: Offset(
                        row3Col1IconOffsetX,
                        0,
                      ),
                      isOnLeft: true,
                      onTap: widget.onTIleClick,
                    ),
                  ),
                  TileContainer(
                    MenuTile(
                      width: tileWidth,
                      position: TilePosition.Row3Col2,
                      offsetX: row3Col2TileOffsetX,
                      iconAngle: rightIconsRotate,
                      iconOffset: Offset(
                        row3Col2IconOffsetX,
                        0,
                      ),
                      isOnLeft: false,
                      onTap: widget.onTIleClick,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
