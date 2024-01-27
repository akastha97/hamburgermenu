import 'package:flutter/material.dart';
import 'package:hamburger_menu/screens/wishlist.dart';
import 'package:hamburger_menu/services/product_services.dart';
import 'package:provider/provider.dart';

import 'screens/cart.dart';
import 'screens/homescreen.dart';
import 'ui_components/custom_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductServices(),
      child: MaterialApp(
        routes: {
          "/cart": (context) => const CartScreen(),
          "/wishlist": (context) => const WishlistScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          drawerTheme: DrawerThemeData(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "S H O P A H O L I C",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const HomeScreen(),
    );
  }
}
