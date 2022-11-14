import 'package:flutter/material.dart';
import 'package:flutter_re/constants/constants.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:provider/provider.dart';

class OrderScreenWidget extends StatelessWidget {
  const OrderScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: Constants.mainPadding,
                      child: Text(
                        'Order',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    context.read<Products>().allInCart == 0
                        ? Text('Cart is empty')
                        : ListProdsInCart(),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Type you phone')),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    title: Text('Thank You'),
                                    content: Text(
                                        'We will contact you as soon as possible'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<BottomMenu>()
                                                .setActiveMenuItem(1);
                                            context
                                                .read<Products>()
                                                .clearCart();
                                            Navigator.pushNamedAndRemoveUntil(
                                                context, '/main', (r) => false);
                                          },
                                          child: Text('ok'))
                                    ],
                                  )),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Constants.mainColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            child: const Text(
                              'Order Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
              price: newProductList[index].price,
              cart: newProductList[index].cart,
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
  int price;
  int cart;
  ListProductBlock({
    required this.ind,
    required this.id,
    required this.name,
    required this.price,
    required this.cart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(220, 241, 241, 241),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyle(fontSize: 15)),
                  Text('\$$price x $cart',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 43, 43, 43))),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
