import 'package:coffee_shop_with_fakestore_api/cart_controller.dart/cart_controller.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/cart_model.dart';
import 'package:coffee_shop_with_fakestore_api/screens/sign_in_page.dart';
import 'package:coffee_shop_with_fakestore_api/service/network_service.dart';
import 'package:flutter/material.dart';

final cartCubit = CartCubit(CartState(Cart(id: 1, items: [])));
final network = HttpNetwork();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SignInPage(),
    );
  }
}
