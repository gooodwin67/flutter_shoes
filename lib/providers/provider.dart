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
  /*final _productList = [
    Product(
        id: 1,
        catId: 1,
        name: 'Nike Air Vapormax 2020',
        photo: 'assets/images/nike1.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 250,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
    Product(
        id: 2,
        catId: 1,
        name: 'Nike Air Vapormax 2020-2',
        photo: 'assets/images/nike2.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
    Product(
        id: 3,
        catId: 1,
        name: 'Nike Air Vapormax 2020-3',
        photo: 'assets/images/nike3.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
    Product(
        id: 4,
        catId: 2,
        name: 'Adidas Shark',
        photo: 'assets/images/adi1.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
    Product(
        id: 5,
        catId: 2,
        name: 'Adidas Shark 2',
        photo: 'assets/images/adi2.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
    Product(
        id: 6,
        catId: 2,
        name: 'Adidas Shark 3',
        photo: 'assets/images/adi3.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
    Product(
        id: 7,
        catId: 1,
        name: 'Nike Air Vapormax 2020',
        photo: 'assets/images/nike1.png',
        active: false,
        cart: 0,
        favourited: 0,
        price: 250,
        category: "Men's shoes",
        score: 4.7,
        sizes: [
          [5, 5.5, 6, 6.5, 7, 7.5, 8],
          ['s', 'm', 'l', 'xl', 'xxl', 'xxxl', 'xxxxl'],
          [38, 39, 40, 41, 42, 43, 44]
        ],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: [Colors.black, Colors.green, Colors.purple]),
  ];*/
  late var _productList;

  get productList => _productList;

  getProdList() {
    getJson().then((value) {
      if (value != null) {
        _productList = value;
      } else {
        getJsonFromFile().then((value) => _productList = value);
      }
    });
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
}
/*
class Product {
  int id;
  int catId;
  String name;
  String photo;
  bool active;
  int cart;
  int favourited;
  double price;
  String category;
  double score;
  List sizes;
  String description;
  List<Color> colors;

  Product(
      {Key? key,
      required this.id,
      required this.catId,
      required this.name,
      required this.photo,
      required this.active,
      required this.cart,
      required this.favourited,
      required this.price,
      required this.category,
      required this.score,
      required this.sizes,
      required this.description,
      required this.colors});
}
*/