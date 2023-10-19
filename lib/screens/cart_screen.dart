import 'package:coffee_shop_with_fakestore_api/app.dart';
import 'package:coffee_shop_with_fakestore_api/cart_controller.dart/cart_controller.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CartState>(
      initialData: cartCubit.state,
      stream: cartCubit.stream,
      builder: (context, child) {
        final cart = cartCubit.state;
        return Scaffold(
          appBar: AppBar(
            title: Text("Total: \$ ${cart.cart.total.toStringAsFixed(2)}"),
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: cart.cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.cart.items[index];
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 80,
                      child: Stack(
                        children: [
                          Image(
                            image: NetworkImage(cartItem.product.image),
                            fit: BoxFit.fitWidth,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: StreamBuilder<Object>(
                                  stream: cartCubit.stream,
                                  initialData: cartCubit.state,
                                  builder: (context, snapshot) {
                                    return Text(
                                      cartItem.quantity.toString(),
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    title: Text(
                      cartItem.product.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(cartItem.product.description),
                            ),
                            const SizedBox(width: 10),
                            Text(cartItem.product.price.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total: ${cartItem.total.toStringAsFixed(2)}"),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xffC67C4E),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    cartCubit.addToCard(
                                        product: cartItem.product, quantity: 1);
                                  },
                                  icon: const Icon(Icons.add)),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xffC67C4E),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  cartCubit.addToCard(
                                      product: cartItem.product, quantity: -1);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.payment_rounded),
          ),
        );
      },
    );
  }
}

                        // const Text(
                        //   "1",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        
                      