import 'package:flutter/material.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_expandable/expandable.dart';
import 'package:flutter_expandable/expander.dart';

class ProductScreenWidget extends StatefulWidget {
  const ProductScreenWidget({super.key});

  @override
  State<ProductScreenWidget> createState() => _ProductScreenWidgetState();
}

class _ProductScreenWidgetState extends State<ProductScreenWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deliveryText = context.watch<Products>().deliveryText;
    var product = context
        .watch<Products>()
        .productList[context.watch<Products>().activeProduct];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.chevron_left),
                  ),
                  Icon(
                    Icons.favorite,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(product.photo)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.category),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text('(${product.score})'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(product.name), Text('\$${product.price}.00')],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Size:'),
                  Row(
                    children: [
                      Text('US'),
                      SizedBox(width: 10),
                      Text('UK'),
                      SizedBox(width: 10),
                      Text('EU'),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: product.sizes_us.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 80,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(230, 211, 211, 211),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(product.sizes_us[index].toString()),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 165, 165, 165)),
                )),
                child: Column(
                  children: [
                    Expander(
                      controller: controller,
                      rotatingArrowColor: Colors.black,
                      rotatingArrowSize: 30,
                      triggerWidgets: [Text('Description')],
                    ),
                    Expandable(
                        controller: controller,
                        child: Container(
                          child: Text(product.description),
                        ),
                        height: 200),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 165, 165, 165)),
                )),
                child: Column(
                  children: [
                    Expander(
                      controller: controller2,
                      rotatingArrowColor: Colors.black,
                      rotatingArrowSize: 30,
                      triggerWidgets: [Text('Free Delivery and Returns')],
                    ),
                    Expandable(
                        controller: controller2,
                        child: Container(
                          child: Text(deliveryText),
                        ),
                        height: 200),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
