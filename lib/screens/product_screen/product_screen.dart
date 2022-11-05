import 'package:flutter/material.dart';
import 'package:flutter_re/constants/constants.dart';
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
    context.read<Products>().resetQuantity();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deliveryText = context.read<Products>().deliveryText;
    List newProductList = context
        .watch<Products>()
        .productList
        .where(
            (element) => element.catId == context.watch<Firms>().activeFirmId)
        .toList();
    var product = newProductList[context.watch<Products>().activeProduct];
    var sizeFormat = context.read<Products>().sizeFormat;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 230, 230, 230),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.chevron_left),
                    ),
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onTap: () {
                      context.read<Products>().setFavourited(product.id);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 230, 230, 230),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        product.favourited == 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        size: 20,
                        color: Constants.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(product.photo)),
              ),
            ),
            Padding(
              padding: Constants.mainPadding2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.category,
                    style: TextStyle(color: Constants.halfColor, fontSize: 15),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Constants.mainColor,
                        size: 19,
                      ),
                      Text('(${product.score})'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: Constants.mainPadding2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: Constants.mainPadding2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Size:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<Products>().changeSizeFormat(0);
                        },
                        child: Text(
                          'US',
                          style: TextStyle(
                              fontWeight: sizeFormat == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          context.read<Products>().changeSizeFormat(1);
                        },
                        child: Text(
                          'UK',
                          style: TextStyle(
                              fontWeight: sizeFormat == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          context.read<Products>().changeSizeFormat(2);
                        },
                        child: Text(
                          'EU',
                          style: TextStyle(
                              fontWeight: sizeFormat == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: product.sizes[0].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {
                          context.read<Products>().setActiveSize(index);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(110, 211, 211, 211),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                product.sizes[sizeFormat][index].toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width:
                                  context.watch<Products>().activeSize == index
                                      ? 80
                                      : 0,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Constants.mainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                context.watch<Products>().activeSize == index
                                    ? product.sizes[sizeFormat][index]
                                        .toString()
                                    : '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: Constants.mainPadding2.copyWith(top: 15),
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
                      triggerWidgets: [
                        Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expandable(
                        controller: controller,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(product.description),
                        ),
                        height: 200),
                  ],
                ),
              ),
            ),
            Padding(
              padding: Constants.mainPadding2,
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
                      triggerWidgets: [
                        Text(
                          'Free Delivery and Returns',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Expandable(
                        controller: controller2,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(deliveryText),
                        ),
                        height: 200),
                  ],
                ),
              ),
            ),
            Padding(
              padding: Constants.mainPadding2.copyWith(bottom: 10),
              child: Container(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.colors.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onTap: () {
                          context.read<Products>().setActiveColor(index);
                        },
                        child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: product.colors[index],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width:
                                  context.watch<Products>().activeColor == index
                                      ? 7
                                      : 0,
                              height: 7,
                              decoration: BoxDecoration(
                                color: Constants.mainColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )),
                      );
                    }),
              ),
            ),
            Padding(
              padding: Constants.mainPadding2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onTap: () {
                          context.read<Products>().minusQuantity();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 197, 197, 197),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, height: 0.90),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 5),
                        child: Text(
                            context.watch<Products>().quantity.toString(),
                            style: TextStyle(fontSize: 20)),
                      ),
                      InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onTap: () {
                          context.read<Products>().plusQuantity();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 197, 197, 197),
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, height: 1.1),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: Constants.mainPadding2.copyWith(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<Products>().addToCart(product.id);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Constants.mainColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
