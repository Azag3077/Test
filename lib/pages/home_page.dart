import 'package:ecommerce/controller.dart';
import 'package:ecommerce/pages/models.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:ecommerce/widgets/paints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController pageController = PageController(viewportFraction: .6);

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

  final List<String> products = [
    "All products",
    "Clothes",
    "Shoes",
    "Watch",
    "Cap",
    "Sport wear",
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    final trendings = data;

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   toolbarHeight: 0.0,
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.dark,
      //     statusBarColor: Colors.transparent
      //   ),
      // ),
      body: CustomPaint(
        painter: AppBarBackgroundPainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 36.0, left: 10.0),
              child: Text(
                'Athletics Shoes\nCollection',
                style: TextStyle(
                  fontSize: 32,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade50
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: products.map((product) => ProductButton(
                    product: product,
                    isCurrent: product == products.elementAt(ref.watch(productIndexStateProvider)),
                    onPressed: () => ref.read(productIndexStateProvider.notifier).update((state) => products.indexOf(product)),
                  )).toList(),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                itemCount: data.length,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  final product = data.elementAt(index);
                  final favourites = ref.watch(favouritesFutureProvider).value??[];
                  return ProductCard(
                    product: product,
                    isFavourite: favourites.contains(product.id),
                    onPressed: () => controller.onFavourite(context, ref, product)
                  );
                },
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Text(
                    'Trendings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(22, 37, 51, 1)
                      // color: Colors.blueGrey
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(22, 37, 51, 1)
                    ),
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(
                        fontSize: 17,
                      )
                    ),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(5.0)),
                    minimumSize: MaterialStatePropertyAll(Size.zero)
                  ),
                  child: const Row(
                    children: <Widget>[
                      Text('See all'),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ],
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: trendings.map((product) => TrendingProductCard(
                    product: product,
                    onPressed: () => controller.onProductSelect(context, ref, product),
                  )).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
