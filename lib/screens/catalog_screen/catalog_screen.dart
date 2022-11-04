import 'package:flutter/material.dart';
import 'package:flutter_re/constants/constants.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:provider/provider.dart';

class CatalogScreenWidget extends StatelessWidget {
  const CatalogScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: Constants.mainPadding,
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Image.asset('assets/icons/icon-menu.jpg'),
              //     Image.asset('assets/icons/icon-cart.jpg')
              //   ],
              // ),
            ),
            // Padding(
            //   padding: Constants.mainPadding,
            //   child: Material(
            //     elevation: 5,
            //     shadowColor: Color.fromARGB(75, 80, 80, 80),
            //     borderRadius: BorderRadius.circular(30),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(30),
            //             borderSide: BorderSide(
            //               color: Color.fromARGB(255, 240, 240, 250),
            //             )),
            //         prefixIcon: Padding(
            //           padding: const EdgeInsets.all(7.0),
            //           child: Image.asset('assets/icons/icon-search.jpg',
            //               width: 10),
            //         ),
            //         labelText: 'Search',
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, top: 15, bottom: 15, right: 0),
              child: Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.read<Firms>().firmList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                          context.read<Firms>().setActive(index);
                        },
                        child: Container(
                          foregroundDecoration: BoxDecoration(
                            color:
                                context.watch<Firms>().firmList[index].active ==
                                        true
                                    ? Color.fromARGB(0, 233, 233, 233)
                                    : Color.fromARGB(233, 233, 233, 233),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 233, 233),
                              borderRadius: BorderRadius.circular(7)),
                          width: 80,
                          height: 50,
                          child: Image.asset(
                            context.watch<Firms>().firmList[index].photo,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: Constants.mainPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color.fromARGB(255, 180, 180, 180),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.format_align_left_rounded,
                      size: 17,
                      color: Color.fromARGB(255, 99, 99, 99),
                    ),
                  ),
                ],
              ),
            ),
            ListProds(),
          ],
        ),
      ),
    );
  }
}

class ListProds extends StatelessWidget {
  const ListProds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productList = context.watch<Products>().productList;
    List newProductList = productList
        .where(
            (element) => element.catId == context.watch<Firms>().activeFirmId)
        .toList();
    //print(newProductList.length);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: newProductList.length,
          itemBuilder: (BuildContext context, index) {
            return ListProductBlock(
              ind: index,
              name: newProductList[index].name,
              photo: newProductList[index].photo,
            );
          },
        ),
      ),
    );
  }
}

class ListProductBlock extends StatelessWidget {
  int ind;
  String name;
  String photo;
  ListProductBlock({
    required this.ind,
    required this.name,
    required this.photo,
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
                    const Text('\$250.00',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 43, 43))),
                    InkWell(
                      onTap: () {
                        context.read<Products>().setFeautered(ind);
                      },
                      child: Icon(
                        Icons.favorite_border,
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
                        print('cart');
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
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
