
import 'package:flutter/material.dart';

import 'meal_menu.dart';
import 'meal_selection.dart';
import 'models.dart';
import 'restart_container.dart';
import 'tile_container.dart';

class MealMenuApp extends StatefulWidget {
  @override
  _MealMenuAppState createState() => _MealMenuAppState();
}

class _MealMenuAppState extends State<MealMenuApp>
    with SingleTickerProviderStateMixin {
  bool isMealMenuPage = true;
  String mealSelectionImageUrl = "";
  String mealSelectionImageCaption = "";

  @override
  Widget build(BuildContext context) {
    final VoidCallback restartFunction =
        () => setState(() => isMealMenuPage = true);

    Widget page = isMealMenuPage
        ? MealMenu(
            restartContainer: RestartContainer(restartFunction),
            onTIleClick: insertTile,
          )
        : MealSelection(
            imageUrl: mealSelectionImageUrl,
            imageCaption: mealSelectionImageCaption,
            restartContainer: RestartContainer(
              restartFunction,
              useRotateTween: false,
            ),
          );

    return AnimatedSwitcher(
      duration: Duration(
        milliseconds: 250,
      ),
      child: page,
    );
  }

  void insertTile(Offset startOffset, MenuTile menuTile) async {
    setState(() {
      mealSelectionImageUrl = menuTile.tileDetails.imageUrl;
      mealSelectionImageCaption = menuTile.tileDetails.imageCaption;
      isMealMenuPage = false;
    });

    const duration = Duration(milliseconds: 1000);
    final tileWidth = menuTile.width;

    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: startOffset.dx,
          top: startOffset.dy,
          child: TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0,
              end: menuTile.isOnLeft ? -tileWidth : tileWidth,
            ),
            duration: duration,
            curve: Curves.bounceOut,
            child: TileContainer(
              menuTile..onMealSelectionPage(),
            ),
            builder: (_, double offsetX, child) {
              return Transform.translate(
                offset: Offset(
                  offsetX,
                  0,
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
    Overlay.of(context)!.insert(entry);
    await Future.delayed(duration);
    entry.remove();
  }
}