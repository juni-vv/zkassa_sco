enum CategoryOption { fruit, veg, bread, drinks }

extension CategoryOptionFunctions on CategoryOption {
  String get getImgPath {
    switch (this) {
      case CategoryOption.fruit:
        return "res/images/category/fruit.png";
      case CategoryOption.veg:
        return "res/images/category/veg.png";
      case CategoryOption.bread:
        return "res/images/category/bread.png";
      case CategoryOption.drinks:
        return "res/images/category/drinks.png";
    }
  }

  String get name {
    switch (this) {
      case CategoryOption.fruit:
        return "Fruit";
      case CategoryOption.veg:
        return "Vegetables";
      case CategoryOption.bread:
        return "Bread";
      case CategoryOption.drinks:
        return "Drinks";
    }
  }
}
