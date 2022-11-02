import 'package:flutter/material.dart';

class Firms with ChangeNotifier {
  final List _firmList = [
    Firm(name: 'Nike', photo: 'assets/icons/icon-nike.png', active: true),
    Firm(name: 'Adidas', photo: 'assets/icons/icon-adidas.png', active: false),
    Firm(name: 'Nike2', photo: 'assets/icons/icon-nike.png', active: false),
    Firm(name: 'Adidas2', photo: 'assets/icons/icon-adidas.png', active: false),
    Firm(name: 'Nike3', photo: 'assets/icons/icon-nike.png', active: false),
    Firm(name: 'Adidas3', photo: 'assets/icons/icon-adidas.png', active: false),
    Firm(name: 'Nike4', photo: 'assets/icons/icon-nike.png', active: false),
    Firm(name: 'Adidas4', photo: 'assets/icons/icon-adidas.png', active: false)
  ];
  List get firmList => _firmList;

  void setActive(index) {
    _firmList.forEach((element) => element.active = false);
    _firmList[index].active = true;
    notifyListeners();
  }
}

class Firm {
  String name;
  String photo;
  bool active;
  Firm(
      {Key? key,
      required this.name,
      required this.photo,
      required this.active});
}

class Products extends ChangeNotifier {
  int activeProduct = 0;
  String deliveryText = 'In this block we have a delivery and return text';
  final _productList = [
    Product(
        name: 'Nike Air Vapormax 2020',
        photo: 'assets/images/nike1.png',
        active: false,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes_us: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        sizes_uk: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        sizes_eu: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: ['black', 'green', 'purple']),
    Product(
        name: 'Nike Air Vapormax 2020-2',
        photo: 'assets/images/nike2.png',
        active: false,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes_us: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        sizes_uk: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        sizes_eu: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: ['black', 'green', 'purple']),
    Product(
        name: 'Nike Air Vapormax 2020-3',
        photo: 'assets/images/nike3.png',
        active: false,
        price: 290,
        category: "Men's shoes",
        score: 4.7,
        sizes_us: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        sizes_uk: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        sizes_eu: [5, 5.5, 6, 6.5, 7, 7.5, 8],
        description:
            'In this block we have any description of this shoes. In this block we have any description of this shoes.',
        colors: ['black', 'green', 'purple'])
  ];
  get productList => _productList;

  void setActiveProduct(index) {
    //_productList.forEach((element) => element.active = false);
    //_productList[index].active = true;
    activeProduct = index;
  }
}

class Product {
  String name;
  String photo;
  bool active;
  int price;
  String category;
  double score;
  List sizes_us;
  List sizes_uk;
  List sizes_eu;
  String description;
  List colors;

  Product(
      {Key? key,
      required this.name,
      required this.photo,
      required this.active,
      required this.price,
      required this.category,
      required this.score,
      required this.sizes_us,
      required this.sizes_uk,
      required this.sizes_eu,
      required this.description,
      required this.colors});
}
