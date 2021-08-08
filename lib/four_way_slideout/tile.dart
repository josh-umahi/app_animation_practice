import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

enum TilePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class Tile extends StatelessWidget {
  final TilePosition tilePosition;
  final Offset offset;

  Tile({
    required Key key,
    required this.tilePosition,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tileDetails = getTileDetails();
    assert(tileDetails.length == 3);

    /// Didn't assert the [tileDetails] index types because
    /// this is just practice and I wanna get used to
    /// more Flutter debug messages
    final Alignment alignment = tileDetails[0];
    final Border border = tileDetails[1];
    final String title = tileDetails[2];

    return Container(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: Constants.widthFactor,
        heightFactor: Constants.heightFactor,
        child: Transform.translate(
          offset: offset,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Constants.primary,
              border: border,
            ),
            child: Text(
              title,
              style: GoogleFonts.pressStart2p(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List getTileDetails() {
    switch (tilePosition) {
      case TilePosition.topLeft:
        return [
          Alignment.topLeft,
          Border(
            right: Constants.border,
            bottom: Constants.border,
          ),
          "New",
        ];
      case TilePosition.topRight:
        return [
          Alignment.topRight,
          Border(
            left: Constants.border,
            bottom: Constants.border,
          ),
          "Explore",
        ];
      case TilePosition.bottomLeft:
        return [
          Alignment.bottomLeft,
          Border(
            right: Constants.border,
            top: Constants.border,
          ),
          "About",
        ];
      default:
        return [
          Alignment.bottomRight,
          Border(
            left: Constants.border,
            top: Constants.border,
          ),
          "Settings",
        ];
    }
  }
}
