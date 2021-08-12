import 'package:flutter/material.dart';

import 'constants.dart';
import 'models.dart';

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

class TileContainer extends StatelessWidget {
  final MenuTile menuTile;
  TileContainer(
    this.menuTile,
  );

  @override
  Widget build(BuildContext context) {
    final String title = menuTile.tileDetails.iconTitle;
    final String iconURL = menuTile.tileDetails.iconUrl;

    return GestureDetector(
      onTap: menuTile.onTap != null
          ? () {
              RenderBox object = context.findRenderObject() as RenderBox;
              Offset globalPosition = object.localToGlobal(Offset.zero);
              menuTile.onTap!(globalPosition, menuTile);
            }
          : null,
      child: Container(
        transform: Matrix4.identity()..translate(menuTile.offsetX),
        width: menuTile.width,
        height: Constants.tileHeight,
        decoration: BoxDecoration(
          color:
              menuTile.isOnMealMenuPage ? Colors.white : Constants.primaryColor,
          borderRadius: menuTile.isOnLeft
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
                offset: menuTile.iconOffset,
                child: Transform.rotate(
                  angle: menuTile.iconAngle,
                  child: Image.asset(
                    iconURL,
                    height: 25,
                    color: menuTile.isOnMealMenuPage
                        ? Constants.primaryColor
                        : Constants.tileContentClickColor,
                  ),
                ),
              ),
              SizedBox(height: 5),
              DefaultTextStyle(
                style: menuTile.isOnMealMenuPage
                    ? Constants.textStyle(16)
                    : Constants.textStyle(16)
                        .copyWith(color: Constants.tileContentClickColor),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
