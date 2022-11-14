import 'package:flutter/material.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:flutter_re/screens/main_screen/main_screen.dart';
import 'package:flutter_re/screens/order_screen/order_screen.dart';
import 'package:flutter_re/screens/product_screen/product_screen.dart';
import 'package:flutter_re/screens/start_screen/start_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Firms()),
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => BottomMenu()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: StartScreenWidget(),
      ),
      routes: {
        '/start': (context) => StartScreenWidget(),
        '/main': (context) => MainScreenWidget(),
        '/main/product': (context) => ProductScreenWidget(),
        '/main/order': (context) => OrderScreenWidget(),
      },
    );
  }
}
