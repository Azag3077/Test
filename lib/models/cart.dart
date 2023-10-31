import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Slides',
      price: '40',
      description: 'The best Nike Slides available',
      imagePath: 'lib/images/nike slides.jpg',
    ),
    Shoe(
      name: 'Air Max 95',
      price: '150',
      description: 'Best shoe available',
      imagePath: 'lib/images/air max 95.jpg',
    ),
    Shoe(
      name: 'Air Force 1',
      price: '150',
      description: 'Best shoe available',
      imagePath: 'lib/images/air force 1.jpg',
    ),
    Shoe(
      name: 'Addidas Slides',
      price: '50',
      description: 'Best slides available',
      imagePath: 'lib/images/adidas slides.jpg',
    ),
  ];

  // list of items in user cart

  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getuserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
