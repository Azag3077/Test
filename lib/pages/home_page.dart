import 'package:ecommerce/controller.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:ecommerce/widgets/paints.dart';
import 'package:ecommerce/widgets/place_holders.dart';
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
  final PageController pageLoadingController =
      PageController(initialPage: 1, viewportFraction: .6);

  @override
  void dispose() {
    pageController.dispose();
    pageLoadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(prefsFutureProvider);
    final categories = ref.watch(categoriesStateProvider);
    final currentCategory = ref.watch(currentCategoryStateProvider);
    final trendings = ref.watch(trendingsStateProvider);

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
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
                      color: Colors.blueGrey.shade50),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: categories
                        .map((product) => ProductButton(
                              product: product,
                              isCurrent: product == currentCategory,
                              onPressed: () {
                                ref
                                    .read(currentCategoryStateProvider.notifier)
                                    .update((state) => product);
                                pageController.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: ref.watch(productsStreamProvider).when(
                    data: (data) => PageView.builder(
                          itemCount: data.length,
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, int index) {
                            final product = data.elementAt(index);
                            final favourites =
                                ref.watch(favoritesStateProvider);
                            return ProductCard(
                                product: product,
                                isFavourite: favourites
                                    .map((e) => e.id)
                                    .contains(product.id),
                                onLike: () => controller.onFavourite(
                                    context, ref, product),
                                onCard: () => controller.onProductSelect(
                                    context, ref, product),
                                onButton: () => controller.addToCart(
                                    context, ref, product));
                          },
                        ),
                    loading: () => const ProductLoadingCard(),
                    error: (_, __) => const Center(child: Text('Error'))),
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
                    onPressed: () => controller.onSeeALl(context),
                    style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(22, 37, 51, 1)),
                        textStyle: MaterialStatePropertyAll(TextStyle(
                          fontSize: 17,
                        )),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(5.0)),
                        minimumSize: MaterialStatePropertyAll(Size.zero)),
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
                    children: trendings
                        .map((product) => TrendingProductCard(
                              product: product,
                              onPressed: () => controller.onProductSelect(
                                  context, ref, product),
                            ))
                        .toList(),
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
