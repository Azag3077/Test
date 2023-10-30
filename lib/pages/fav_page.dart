import 'package:ecommerce/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> images = [
      "addidas female swift run.jpg",
      "addidas female tubular.jpg",
      "addidas hoodie.jpg",
      "addidas nmd.jpg",
      "addidas trainers.jpg",
      "addidas 2.jpg",
      "air force second.jpg",
      "air jordans.jpg",
      "air jordans 2.jpg",
      "air max.jpg",
      "air max 95.jpg",
      "Amazing.jpg",
      "Back sports vest.jpg",
      "background.jpg",
      "Black vest.jpg",
      "female trainers.jpg",
      "female trainers 2.jpg",
      "female trainers 3.jpg",
      "female trainers 4.jpg",
      "good.jpg",
      "Grey sleeve less sports top.jpg",
      "kids trainer 2.jpg",
      "kids trainers.jpg",
      "kids trainers 3.jpg",
      "kids trainers 4.jpg",
      "kids trainers 5.jpg",
      "kids trainers 6.jpg",
      "koi.jpg",
      "Longsleeve sports vest.jpg",
      "Nevy Blue long sleeve sports wear.jpg",
      "new.jpg",
      "nice.jpg",
      "nmd.jpg",
      "nmd 2.jpg",
      "No nO.jpg",
      "Red and yellow sports top.jpg",
      "Red sports vest.jpg",
      "sports good.jpg",
      "Sports top.jpg",
      "Sports vest.jpg",
      "tracksuit.jpg",
    ];
    final data = images.map((image) {
      final index = images.indexOf(image);
      return Product(
        id: "id_$index",
        name: "name $index",
        price: "price",
        color: "color",
        gender: "gender",
        category: "category",
        images: [image, image, image],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(22, 37, 51, 1),
        title: const Text('My Favourites'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: OrderCard(
              order: data.elementAt(index),
            )
          );
        },
      ),
    );
  }
}
