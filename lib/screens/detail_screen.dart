import 'package:coffee_shop_with_fakestore_api/app.dart';
import 'package:coffee_shop_with_fakestore_api/cart_controller.dart/cart_controller.dart';
import 'package:coffee_shop_with_fakestore_api/constants/strings.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/product_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.detail,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                height: 25,
                width: 25,
                fit: BoxFit.contain,
                image: AssetImage(
                  "assets/icon/icon_heart.png",
                ),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<CartState>(
          initialData: cartCubit.state,
          stream: cartCubit.stream,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height / 4,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            // color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage(product.image),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('assets/icon/Rating.png'),
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      Strings.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        color: Color(0xff9B9B9B),
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 10,
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 100,
        child: SizedBox(
          height: 150,
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    Strings.price,
                    style: TextStyle(
                      color: Color(0xff9B9B9B),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      color: Color(0xffC67C4E),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                height: 60,
                width: MediaQuery.sizeOf(context).width / 2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xffC67C4E),
                    ),
                    overlayColor: MaterialStatePropertyAll(
                      Colors.black.withOpacity(0.1),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    Strings.buyNow,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
