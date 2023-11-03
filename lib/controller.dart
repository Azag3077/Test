import 'package:ecommerce/pages/description_page.dart';
import 'package:ecommerce/pages/models.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller {

  void onProductSelect(BuildContext context, WidgetRef ref, Product product) {
    ref.read(selectedProductStateProvider.notifier).update((state) => product);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DescriptionPage(product: product))
    );
  }

  Future<void> onFavourite(BuildContext context, WidgetRef ref, Product product) async {
    final favourites = ref.watch(favoritesStateProvider);
    final SharedPreferences prefs = ref.watch(prefsFutureProvider).value!;
    final favouritesId = prefs.get('favoriteIds') as List<String>?;

    if (favourites.map((e) => e.id).contains(product.id)) {
      favourites.remove(product);
      favouritesId?.remove(product.id);
    } else {
      favourites.add(product);
      favouritesId?.add(product.id);
    }
    prefs.setStringList('favoriteIds', favouritesId??[]);
    ref.read(favoritesStateProvider.notifier).update((state) => [...favourites]);
  }

  void addToCart(BuildContext context, WidgetRef ref, Product product) {
    final carts = ref.watch(cartsStateProvider);
    final SharedPreferences prefs = ref.watch(prefsFutureProvider).value!;
    final cartIds = (prefs.get('cartIds') as List<String>?)??[];

    print(cartIds);

    final int index = cartIds.map((e) => e.split('//').first).toList().indexOf(product.id);
    String count = '0';

    if (index != -1) {
      count = '${((int.tryParse(cartIds[index].split('//').last)??0) + 1)}';
      cartIds[index] = '${product.id}//$count';
      carts[index] = product.copyWith(count: count);
    } else {
      carts.add(product.copyWith(count: count));
      cartIds.add('${product.id}//$count');
      prefs.setStringList('cartIds', cartIds);
    }


    print(cartIds);
    // prefs.setStringList('cartIds', []);
    ref.read(cartsStateProvider.notifier).update((state) => [...carts]);
    // ref.read(cartsStateProvider.notifier).update((state) => [...[]]);
  }

  void removeFromCart(BuildContext context, WidgetRef ref, Product product, [bool? skip]) {
    final carts = ref.watch(cartsStateProvider);
    final SharedPreferences prefs = ref.watch(prefsFutureProvider).value!;
    final cartIds = (prefs.get('cartIds') as List<String>?)??[];

    final int index = cartIds.map((e) => e.split('//').first).toList().indexOf(product.id);
    final int count = ((int.tryParse(cartIds[index].split('//').last)??0) - 1);

    if (count < 1 && skip == null) {
      return _showRemoveFromCartDialog(
        context,
        onRemove: () {
          removeFromCart(context, ref, product, true);
          carts.remove(carts[index]);
          ref.read(cartsStateProvider.notifier).update((state) => [...carts]);
        }
      );
    }

    cartIds[index] = '${product.id}//$count';
    carts[index] = product.copyWith(count: count.toString());
    ref.read(cartsStateProvider.notifier).update((state) => [...carts]);
  }

  void _showRemoveFromCartDialog(BuildContext context, {required VoidCallback onRemove}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RemoveFromCartDialog(
          onRemove: onRemove,
        );
      },
    );
  }

  void _showRemoveFromCartBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) => Container(
          color: Colors.red,
        ))
    );
  }
}

final controller = Controller();