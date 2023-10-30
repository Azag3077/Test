import 'package:ecommerce/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          backgroundColor: Colors.transparent,
          title: const Text('Discovery'),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      splashRadius: 27,
                      color: Colors.white,
                      icon: const Icon(Icons.sort),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: OrderCard(
                      order: data.elementAt(index),
                    )
                  );
                },
              ),
            )
            // Expanded(
            //   child: RefreshIndicator(
            //     onRefresh: () => centralController.refreshUserSellOrderPage(ref),
            //     child: ListView.separated(
            //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            //       itemCount: data.length,
            //       separatorBuilder: (_, __) => const SizedBox(height: 8.0),
            //       itemBuilder: (_, int index) {
            //         final Item item = data.elementAt(index);
            //
            //         return OrderCard(
            //           order: item,
            //           onPressed: () => centralController.onViewSpec(context, ref, item),
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
