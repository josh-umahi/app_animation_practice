import 'package:flutter/material.dart';

import 'constants.dart';

enum TilePosition {
  Row1Col1,
  Row1Col2,
  Row2Col1,
  Row2Col2,
  Row3Col1,
  Row3Col2,
}

class TileRow extends StatelessWidget {
  final List<Widget> tiles;
  const TileRow({
    required this.tiles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tiles,
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final double tileWidth;
  final TilePosition tilePosition;
  final Offset tileOffset;
  final double iconAngle;
  final Offset iconOffset;
  final bool isOnLeft;

  MenuTile({
    required this.tileWidth,
    required this.tilePosition,
    required this.tileOffset,
    required this.iconAngle,
    required this.iconOffset,
    required this.isOnLeft,
  });

  @override
  Widget build(BuildContext context) {
    final tileDetails = getTileDetails();
    assert(tileDetails.length == 2);

    /// Didn't assert the [tileDetails] index types because
    /// this is just practice and I wanna get used to
    /// more Flutter debug messages
    final String title = tileDetails[0];
    final String iconURL = tileDetails[1];

    return GestureDetector(
      child: Transform.translate(
        offset: tileOffset,
        child: Container(
          width: tileWidth,
          height: Constants.tileHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            // color: Constants.tileBgClickColor,
            borderRadius: isOnLeft
                ? BorderRadius.horizontal(
                    right: Constants.borderRadius,
                  )
                : BorderRadius.horizontal(
                    left: Constants.borderRadius,
                  ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: Constants.leftPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: iconOffset,
                  child: Transform.rotate(
                    angle: iconAngle,
                    child: Image.asset(
                      iconURL,
                      height: 25,
                      color: Constants.primaryColor,
                      // color: Constants.tileContentClickColor,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: Constants.textStyle(16),
                  // style: Constants.textStyle(16).copyWith(color: Constants.tileContentClickColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List getTileDetails() {
    switch (tilePosition) {
      case TilePosition.Row1Col1:
        return [
          "Burger",
          "assets/meal_menu/burger.png",
        ];
      case TilePosition.Row1Col2:
        return [
          "Coffee",
          "assets/meal_menu/coffee.png",
        ];
      case TilePosition.Row2Col1:
        return [
          "Dessert",
          "assets/meal_menu/dessert.png",
        ];
      case TilePosition.Row2Col2:
        return [
          "Cocktail",
          "assets/meal_menu/cocktail.png",
        ];
      case TilePosition.Row3Col1:
        return [
          "Pizza",
          "assets/meal_menu/pizza.png",
        ];
      default:
        return [
          "Energy drink",
          "assets/meal_menu/energy_drink.png",
        ];
    }
  }
}
