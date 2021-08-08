import 'package:flutter/material.dart';

import 'constants.dart';

enum TilePosition {
  A,
  B,
  C,
  D,
  E,
  F,
}

class TileRow extends StatelessWidget {
  final TilePosition leftTilePosition;
  final TilePosition rightTilePosition;

  const TileRow({
    required this.leftTilePosition,
    required this.rightTilePosition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuTile(
            tilePosition: leftTilePosition,
            isOnLeft: true,
          ),
          MenuTile(
            tilePosition: rightTilePosition,
            isOnLeft: false,
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final TilePosition tilePosition;
  final bool isOnLeft;

  MenuTile({
    required this.tilePosition,
    required this.isOnLeft,
  });

  @override
  Widget build(BuildContext context) {
    final tileWidth = MediaQuery.of(context).size.width / 2 - 10;

    final tileDetails = getTileDetails();
    assert(tileDetails.length == 2);

    /// Didn't assert the [tileDetails] index types because
    /// this is just practice and I wanna get used to
    /// more Flutter debug messages
    final String title = tileDetails[0];
    final String iconURL = tileDetails[1];

    return GestureDetector(
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
              Image.asset(
                iconURL,
                height: 25,
                color: Constants.primaryColor,
                // color: Constants.tileContentClickColor,
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
    );
  }

  List getTileDetails() {
    switch (tilePosition) {
      case TilePosition.A:
        return [
          "Burger",
          "assets/meal_menu/burger.png",
        ];
      case TilePosition.B:
        return [
          "Coffee",
          "assets/meal_menu/coffee.png",
        ];
      case TilePosition.C:
        return [
          "Dessert",
          "assets/meal_menu/dessert.png",
        ];
      case TilePosition.D:
        return [
          "Cocktail",
          "assets/meal_menu/cocktail.png",
        ];
      case TilePosition.E:
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
