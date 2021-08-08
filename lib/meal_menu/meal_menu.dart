import 'package:flutter/material.dart';

import 'constants.dart';
import 'tile.dart';

class MealMenu extends StatefulWidget {
  @override
  _MealMenuState createState() => _MealMenuState();
}

class _MealMenuState extends State<MealMenu>
    with SingleTickerProviderStateMixin {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.initialBgColor,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, state) {
          final animationControllerValue = animationController.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 43),
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Constants.primaryColor,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
              TileRow(
                leftTilePosition: TilePosition.A,
                rightTilePosition: TilePosition.B,
              ),
              TileRow(
                leftTilePosition: TilePosition.C,
                rightTilePosition: TilePosition.D,
              ),
              TileRow(
                leftTilePosition: TilePosition.E,
                rightTilePosition: TilePosition.F,
              ),
            ],
          );
        },
      ),
    );
  }
}
