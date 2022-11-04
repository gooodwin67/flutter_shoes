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
          height: 60.0,
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
                  size: 30,
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
                child: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: context.watch<BottomMenu>().activeMenuItem == 2
                      ? Constants.mainColor
                      : Colors.black,
                ),
              ),
              SizedBox(),
              InkWell(
                onTap: () {
                  context.read<BottomMenu>().setActiveMenuItem(3);
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: context.watch<BottomMenu>().activeMenuItem == 3
                      ? Constants.mainColor
                      : Colors.black,
                ),
              ),
              SizedBox(),
              InkWell(
                onTap: () {
                  context.read<BottomMenu>().setActiveMenuItem(4);
                },
                child: Icon(
                  Icons.contact_support_outlined,
                  size: 30,
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
