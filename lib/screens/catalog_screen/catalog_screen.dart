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
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: true,
            pinned: false,
            snap: false,
            titleSpacing: 0,
            backgroundColor: Color.fromARGB(255, 8, 8, 8),
            automaticallyImplyLeading: false,
            expandedHeight: 59,
            title: Padding(
              padding:
                  const EdgeInsets.only(left: 0, top: 10, bottom: 10, right: 0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
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
                          padding: EdgeInsets.all(11),
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
          ),
          SliverAppBar(
            //shadowColor: Colors.white,
            elevation: 0,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context
                        .read<Firms>()
                        .firmList[context.watch<Firms>().activeFirmId - 1]
                        .name
                        .toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
          ),
          ListProds(),
        ],
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
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: newProductList.length,
      (BuildContext context, index) {
        return ListProductBlock(
          ind: index,
          id: newProductList[index].id,
          name: newProductList[index].name,
          photo: newProductList[index].photo,
          price: newProductList[index].price,
          feautered: newProductList[index].favourited,
        );
      },
    ));
  }
}

class ListProductBlock extends StatelessWidget {
  int ind;
  int id;
  String name;
  String photo;
  int price;
  int feautered;
  ListProductBlock({
    required this.ind,
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.feautered,
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
            context.read<Products>().setActiveProduct(id);
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
                    Text('\$$price',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 43, 43))),
                    InkWell(
                      onTap: () {
                        context.read<Products>().setFavourited(id);
                      },
                      child: Icon(
                        feautered > 0 ? Icons.favorite : Icons.favorite_border,
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
                        context.read<Products>().addToCart(id);
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
