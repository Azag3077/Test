import 'package:ecommerce/controller.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(cartsStateProvider).reversed;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Carts',
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: favorites.isNotEmpty ?
      Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                final product = favorites.elementAt(index);
                return CartCard(
                  product: product,
                  onPressed: () => controller.onProductSelect(context, ref, product),
                  onAddCart: () => controller.addToCart(context, ref, product),
                  onRemoveCart: () => controller.removeFromCart(context, ref, product),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 12.0)
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(22, 37, 51, 1)
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  )
                )
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Proceed to checkout'),
                  SizedBox(width: 15.0),
                  Icon(Icons.shopping_cart_checkout, size: 20.0,)
                ],
              ),
            ),
          ),
        ],
      ) :
      const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('You do not have any favourite item.'),
        ),
      ),
    );
  }
}
