import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/components/cart_item.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 20),

            Expanded(
                child: ListView.builder(
                    itemCount: value.getuserCart().length,
                    itemBuilder: (context, index) {
                      // get individual shoe
                      Shoe individualShoe = value.getuserCart()[index];

                      // return the cart item
                      return CartItem(shoe: individualShoe);
                    },
                    ),
                    ),
          ],
        ),
      ),
    );
  }
}
