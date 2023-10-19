import 'package:coffee_shop_with_fakestore_api/app.dart';
import 'package:coffee_shop_with_fakestore_api/cart_controller.dart/cart_controller.dart';
import 'package:coffee_shop_with_fakestore_api/constants/strings.dart';
import 'package:coffee_shop_with_fakestore_api/core/api.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/product_model.dart';
import 'package:coffee_shop_with_fakestore_api/screens/cart_screen.dart';
import 'package:coffee_shop_with_fakestore_api/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List texts = [
    Strings.cappuccino,
    Strings.machiato,
    Strings.latte,
    Strings.americano,
  ];
  List<Product> products = [];

  void getAllProducts() async {
    final data = await network.methodGet(api: Api.apiProduct);
    products = network.parseProductAll(data!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage("assets/image/person.png"),
            ),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.location,
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              Text(
                Strings.bilzen,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 5,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.grey.shade900,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 3,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
              ),
            ],
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      // scrollPadding: EdgeInsets.zero,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xffC67C4E),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Transform.scale(
                            scale: 0.6,
                            child: const Image(
                              image: AssetImage("assets/icon/setting-4.png"),
                            ),
                          ),
                        ),
                        hintText: Strings.search,
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/image 8 1.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < texts.length; i++)
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, bottom: 10, top: 10),
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              backgroundColor: const MaterialStatePropertyAll(
                                Colors.white,
                              ),
                              overlayColor: MaterialStatePropertyAll(
                                Colors.black.withOpacity(0.1),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              texts[i],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 365,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: StreamBuilder<CartState>(
                        initialData: cartCubit.state,
                        stream: cartCubit.stream,
                        builder: (context, snapshot) {
                          return GridView.count(
                            padding: const EdgeInsets.all(20),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.6,
                            children: products.map((product) {
                              return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(product: product),
                                  ),
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.2),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          height: 150,
                                          width: 170,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                product.image,
                                              ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  product.title,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "\$${product.price}",
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xffC67C4E),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: IconButton(
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          cartCubit.addToCard(
                                                              product: product,
                                                              quantity: 1);
                                                        },
                                                        icon: const Icon(
                                                            Icons.add)),
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xffC67C4E),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: IconButton(
                                                      color: Colors.white,
                                                      onPressed: () {
                                                        cartCubit.addToCard(
                                                            product: product,
                                                            quantity: -1);
                                                      },
                                                      icon: const Icon(
                                                          Icons.remove),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/icon/Home.png"),
              height: 30,
              width: 30,
              fit: BoxFit.contain,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/icon/Heart.png"),
              height: 30,
              width: 30,
              fit: BoxFit.contain,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartScreen(),
              )),
              child: Badge(
                alignment: const Alignment(0.8, -0.8),
                label: StreamBuilder<CartState>(
                  initialData: cartCubit.state,
                  stream: cartCubit.stream,
                  builder: (context, snapshot) {
                    return Text(cartCubit.state.cart.items.length.toString());
                  },
                ),
                child: const Image(
                  image: AssetImage("assets/icon/Bag 2.png"),
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/icon/Notification.png"),
              height: 30,
              width: 30,
              fit: BoxFit.contain,
            ),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
