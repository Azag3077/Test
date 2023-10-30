import 'package:ecommerce/pages/description_page.dart';
import 'package:ecommerce/pages/models.dart';
import 'package:ecommerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller {

  void onProductSelect(BuildContext context, WidgetRef ref, Product product) {
    ref.read(selectedProductStateProvider.notifier).update((state) => product);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DescriptionPage())
    );
  }

  Future<void> onFavourite(BuildContext context, WidgetRef ref, Product product) async {
    final favourites = ref.refresh(favouritesFutureProvider).value??[];
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (favourites.contains(product.id)) {
      favourites.remove(product.id);
    } else {
      favourites.add(product.id);
    }
    prefs.setStringList('favorites', favourites);
    ref.refresh(favouritesFutureProvider);
  }
}

final controller = Controller();