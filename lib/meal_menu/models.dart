import 'package:flutter/material.dart';

enum TilePosition {
  Row1Col1,
  Row1Col2,
  Row2Col1,
  Row2Col2,
  Row3Col1,
  Row3Col2,
}

class MenuTile {
  final double width;
  final TilePosition position;
  final double offsetX;
  final double iconAngle;
  final Offset iconOffset;
  final bool isOnLeft;
  bool isOnMealMenuPage;
  Function(Offset startOffset, MenuTile menuTile)? onTap;

  MenuTile({
    required this.width,
    required this.position,
    required this.offsetX,
    required this.iconAngle,
    required this.iconOffset,
    required this.isOnLeft,
    required this.onTap,
    this.isOnMealMenuPage = true,
  });

  void onMealSelectionPage() {
    isOnMealMenuPage = false;
    onTap = null;
  }

  TileDetails get tileDetails {
    switch (position) {
      case TilePosition.Row1Col1:
        return TileDetails(
          iconTitle: "Burger",
          iconUrl: "assets/meal_menu/burger.png",
          imageCaption: "Yeah let's just forget you were fasting",
          imageUrl: "assets/meal_menu/burger.webp",
        );
      case TilePosition.Row1Col2:
        return TileDetails(
          iconTitle: "Coffee",
          iconUrl: "assets/meal_menu/coffee.png",
          imageCaption: "Let's get grinding!",
          imageUrl: "assets/meal_menu/coffee.webp",
        );
      case TilePosition.Row2Col1:
        return TileDetails(
          iconTitle: "Dessert",
          iconUrl: "assets/meal_menu/dessert.png",
          imageCaption: "Weren't you on a diet?",
          imageUrl: "assets/meal_menu/dessert_img.png",
        );
      case TilePosition.Row2Col2:
        return TileDetails(
          iconTitle: "Cocktail",
          iconUrl: "assets/meal_menu/cocktail.png",
          imageCaption: "Here, have a drink!",
          imageUrl: "assets/meal_menu/cocktail.jpg",
        );
      case TilePosition.Row3Col1:
        return TileDetails(
          iconTitle: "Pizza",
          iconUrl: "assets/meal_menu/pizza.png",
          imageCaption: "Hope you're sharing with a friend",
          imageUrl: "assets/meal_menu/pizza.webp",
        );
      default:
        return TileDetails(
          iconTitle: "Energy drink",
          iconUrl: "assets/meal_menu/energy_drink.png",
          imageCaption: "Drink me and get your ass back back to work!",
          imageUrl: "assets/meal_menu/energy_drink.jpg",
        );
    }
  }
}

class TileDetails {
  final String iconTitle;
  final String iconUrl;
  final String imageCaption;
  final String imageUrl;

  TileDetails({
    required this.iconTitle,
    required this.iconUrl,
    required this.imageCaption,
    required this.imageUrl,
  });
}
