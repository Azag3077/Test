import 'package:ecommerce/controller.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:ecommerce/widgets/paints.dart';
import 'package:ecommerce/widgets/place_holders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeALlPage extends ConsumerWidget {
  const SeeALlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesStateProvider);
    final currentCategory = ref.watch(currentCategoryStateProvider);

    return Scaffold(
      body: CustomPaint(
        painter: AppBarBackgroundPainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      splashRadius: 24,
                      icon: const Icon(Icons.close, color: Colors.grey)
                    ),
                    IconButton(
                      onPressed: () => controller.onSortIcon(context, ref),
                      splashRadius: 24,
                      icon: const Icon(Icons.sort, color: Colors.grey)
                    ),
                  ],
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Row(
                  children: categories.map((product) => ProductButton(
                    product: product,
                    isCurrent: product == currentCategory,
                    onPressed: () => ref.read(currentCategoryStateProvider.notifier).update((state) => product)
                  )).toList(),
                ),
              ),
            ),

            Expanded(
              child: ref.watch(seeAllStreamProvider).when(
                data: (data) => GridView.builder(
                  itemCount: data.length,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 16.0, // Spacing between columns
                    mainAxisSpacing: 16.0, // Spacing between rows
                    childAspectRatio: .8
                  ),
                  itemBuilder: (_, int index) {
                    final product = data.elementAt(index);
                    final favourites = ref.watch(favoritesStateProvider);
                    return ProductCard2(
                      product: product,
                      isFavourite: favourites.map((e) => e.id).contains(product.id),
                      onLike: () => controller.onFavourite(context, ref, product),
                      onCard: () => controller.onProductSelect(context, ref, product),
                    );
                  }
                ),
                loading: () => const ProductLoadingCard2(),
                error: (_, __) => const Center(child: Text('Error'))),
            ),
          ],
        ),
      ),
    );
  }
}
