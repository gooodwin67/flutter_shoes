import 'package:flutter/material.dart';
import 'package:flutter_re/constants/constants.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:flutter_re/screens/cart_screen/cart_screen.dart';
import 'package:flutter_re/screens/catalog_screen/catalog_screen.dart';
import 'package:flutter_re/screens/features_screen/features_screen.dart';
import 'package:flutter_re/screens/help_screen/help_screen.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List listScreens = [
      CatalogScreenWidget(),
      FeaturesScreenWidget(),
      CartScreenWidget(),
      HelpScreenWidget()
    ];
    List firmList = context.watch<Firms>().firmList;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        //shape: CircularNotchedRectangle(),
        child: Container(
          height: 55.0,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              InkWell(
                onTap: () {
                  context.read<BottomMenu>().setActiveMenuItem(1);
                },
                child: Icon(
                  Icons.list_alt,
                  size: 25,
                  color: context.watch<BottomMenu>().activeMenuItem == 1
                      ? Constants.mainColor
                      : Colors.black,
                ),
              ),
              SizedBox(),
              InkWell(
                onTap: () {
                  context.read<BottomMenu>().setActiveMenuItem(2);
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: context.watch<BottomMenu>().activeMenuItem == 2
                          ? Constants.mainColor
                          : Colors.black,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            color: Constants.mainColor.withAlpha(200),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          context.watch<Products>().allFavourited.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(),
              InkWell(
                onTap: () {
                  context.read<BottomMenu>().setActiveMenuItem(3);
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                      color: context.watch<BottomMenu>().activeMenuItem == 3
                          ? Constants.mainColor
                          : Colors.black,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            color: Constants.mainColor.withAlpha(200),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          context.watch<Products>().allInCart.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(),
              InkWell(
                onTap: () {
                  context.read<BottomMenu>().setActiveMenuItem(4);
                },
                child: Icon(
                  Icons.contact_support_outlined,
                  size: 25,
                  color: context.watch<BottomMenu>().activeMenuItem == 4
                      ? Constants.mainColor
                      : Colors.black,
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
      body: listScreens[context.watch<BottomMenu>().activeMenuItem - 1],
    );
  }
}
