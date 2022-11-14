import 'package:flutter/material.dart';
import 'package:flutter_re/api/api.dart';

class BottomMenu with ChangeNotifier {
  int activeMenuItem = 1;

  void setActiveMenuItem(index) {
    activeMenuItem = index;
    notifyListeners();
  }
}

class Firms with ChangeNotifier {
  int activeFirmId = 1;
  final List _firmList = [
    Firm(
        id: 1, name: 'Nike', photo: 'assets/icons/icon-nike.png', active: true),
    Firm(
        id: 2,
        name: 'Adidas',
        photo: 'assets/icons/icon-adidas.png',
        active: false),
    Firm(
        id: 3,
        name: 'Nike2',
        photo: 'assets/icons/icon-nike.png',
        active: false),
    Firm(
        id: 4,
        name: 'Adidas2',
        photo: 'assets/icons/icon-adidas.png',
        active: false),
    Firm(
        id: 5,
        name: 'Nike3',
        photo: 'assets/icons/icon-nike.png',
        active: false),
    Firm(
        id: 6,
        name: 'Adidas3',
        photo: 'assets/icons/icon-adidas.png',
        active: false),
    Firm(
        id: 7,
        name: 'Nike4',
        photo: 'assets/icons/icon-nike.png',
        active: false),
    Firm(
        id: 8,
        name: 'Adidas4',
        photo: 'assets/icons/icon-adidas.png',
        active: false)
  ];
  List get firmList => _firmList;

  void setActive(index) {
    _firmList.forEach((element) => element.active = false);
    _firmList[index].active = true;
    activeFirmId = index + 1;
    notifyListeners();
  }
}

class Firm {
  int id;
  String name;
  String photo;
  bool active;
  Firm(
      {Key? key,
      required this.id,
      required this.name,
      required this.photo,
      required this.active});
}

class Products extends ChangeNotifier {
  int activeProduct = 0;
  String deliveryText = 'In this block we have a delivery and return text';
  int quantity = 1;
  int sizeFormat = 0;
  int activeSize = 0;
  int activeColor = 0;
  int allFavourited = 0;
  int allInCart = 0;

  late var _productList;

  get productList => _productList;

  getProdList() {
    getJsonFromFile().then((value) => _productList = value);
  }

  void setActiveProduct(index) {
    //_productList.forEach((element) => element.active = false);
    //_productList[index].active = true;
    int i = 0;
    _productList.forEach((element) {
      element.id == index ? activeProduct = i : null;
      i++;
    });
  }

  void plusQuantity() {
    quantity++;
    notifyListeners();
  }

  void minusQuantity() {
    quantity > 1 ? quantity-- : quantity = 1;
    notifyListeners();
  }

  void resetQuantity() {
    quantity = 1;
  }

  void changeSizeFormat(index) {
    sizeFormat = index;
    notifyListeners();
  }

  void setActiveSize(index) {
    activeSize = index;
    notifyListeners();
  }

  void setActiveColor(index) {
    activeColor = index;
    notifyListeners();
  }

  void setFavourited(index) {
    //print(index);
    for (var e in _productList) {
      if (e.id == index) {
        e.favourited == 1
            ? {e.favourited = 0, allFavourited--}
            : {e.favourited = 1, allFavourited++};
      }
    }
    notifyListeners();
  }

  void addToCart(index) {
    for (var e in _productList) {
      if (e.id == index) {
        e.cart = e.cart + 1 * quantity;
        allInCart = allInCart + 1 * quantity;
      }
    }
    quantity = 1;
    notifyListeners();
  }

  void removeFromCart(index) {
    for (var e in _productList) {
      if (e.id == index) {
        allInCart -= 1;
        e.cart = 0;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    allInCart = 0;
    for (var e in _productList) {
      e.cart = 0;
    }
  }
}
