import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future getJson() async {
  //String response = await rootBundle.loadString('assets/bd/products.json');
  var response = await http
      .get(Uri.https('my-json-server.typicode.com', '/gooodwin67/json/db'));
  if (response.statusCode != 200) {
    return null;
  }

  final responseMap = await jsonDecode(response.body);

  final data = ProsuctList.fromJson(responseMap);
  final productList = data.productList.map((e) => Product.fromJson(e)).toList();
  //print(productList[0].colors[2]);
  return productList;
}

Future getJsonFromFile() async {
  String response = await rootBundle.loadString('assets/bd/products.json');

  final responseMap = await jsonDecode(response);

  final data = ProsuctList.fromJson(responseMap);
  final productList = data.productList.map((e) => Product.fromJson(e)).toList();
  //print(productList[0].colors[2]);
  return productList;
}

class ProsuctList {
  List productList;
  ProsuctList({required this.productList});

  factory ProsuctList.fromJson(Map<String, dynamic> json) {
    return ProsuctList(productList: json["productList"]);
  }
}

class Product {
  int id;
  int catId;
  String name;
  String photo;
  bool active;
  int cart;
  int favourited;
  int price;
  String category;
  double score;
  List sizes;
  String description;
  List<dynamic> colors;

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
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      catId: json["catId"],
      name: json["name"],
      photo: json["photo"],
      active: json["active"],
      cart: json["cart"],
      favourited: json["favourited"],
      price: json["price"],
      category: json["category"],
      score: json["score"],
      sizes: json["sizes"],
      description: json["description"],
      colors: json["colors"],
    );
  }
}
