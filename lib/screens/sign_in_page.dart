import 'package:coffee_shop_with_fakestore_api/constants/strings.dart';
import 'package:coffee_shop_with_fakestore_api/screens/home_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 1.5,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/coffee_image.png"),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 3,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.black,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(
                  flex: 10,
                ),
                const Text(
                  Strings.coffeeSo,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  Strings.theBest,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  height: 70,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        )),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        overlayColor: MaterialStatePropertyAll(
                            Colors.black.withOpacity(0.1))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage("assets/icon/Google Logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          Strings.continueWith,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
