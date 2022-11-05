import 'package:flutter/material.dart';
import 'package:flutter_re/constants/constants.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: Constants.mainPadding,
                child: Text(
                  'Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              context.read<Products>().allInCart == 0
                  ? Text('Cart is empty')
                  : ListProdsInCart(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListProdsInCart extends StatelessWidget {
  const ListProdsInCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productList = context.watch<Products>().productList;
    List newProductList =
        productList.where((element) => element.cart > (0)).toList();
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: newProductList.length,
          itemBuilder: (BuildContext context, index) {
            return ListProductBlock(
              ind: index,
              id: newProductList[index].id,
              name: newProductList[index].name,
              photo: newProductList[index].photo,
              price: newProductList[index].price,
              cart: newProductList[index].cart,
              favourited: newProductList[index].favourited,
            );
          },
        ),
      ),
    );
  }
}

class ListProductBlock extends StatelessWidget {
  int ind;
  int id;
  String name;
  String photo;
  double price;
  int cart;
  int favourited;
  ListProductBlock({
    required this.ind,
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.cart,
    required this.favourited,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          onTap: () {
            context.read<Products>().setActiveProduct(ind);
            Navigator.pushNamed(context, '/main/product');
          },
          splashColor: Color.fromARGB(255, 0, 0, 0),
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(220, 241, 241, 241),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(photo),
                  scale: 2,
                  alignment: Alignment.center,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$$price x $cart',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 43, 43))),
                    InkWell(
                      onTap: () {
                        context.read<Products>().setFavourited(id);
                      },
                      child: Icon(
                        favourited > 0 ? Icons.favorite : Icons.favorite_border,
                        color: Constants.mainColor,
                        size: 22,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        context.read<Products>().removeFromCart(id);
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Color.fromARGB(255, 248, 135, 135),
                            )),
                        child: Icon(
                          Icons.delete_forever_rounded,
                          color: Color.fromARGB(255, 231, 33, 33),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
