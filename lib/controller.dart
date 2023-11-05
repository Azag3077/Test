import 'package:ecommerce/pages/description_page.dart';
import 'package:ecommerce/pages/models.dart';
import 'package:ecommerce/pages/see_all_page.dart';
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

    final int index = cartIds.map((e) => e.split('//').first).toList().indexOf(product.id);
    String count = '1';

    if (index != -1) {
      count = '${((int.tryParse(cartIds[index].split('//').last)??0) + 1)}';
      cartIds[index] = '${product.id}//$count';
      carts[index] = product.copyWith(count: count);
    } else {
      carts.add(product.copyWith(count: count));
      cartIds.add('${product.id}//$count');
      prefs.setStringList('cartIds', cartIds);
    }

    ref.read(cartsStateProvider.notifier).update((state) => [...carts]);
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
          cartIds.removeWhere((element) => element.split('//').first == product.id);
          prefs.setStringList('cartIds', cartIds);
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

  void onSeeALl(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SeeALlPage())
    );
  }

  void onSortIcon(BuildContext context, WidgetRef ref) {
    _showSortBottomSheetDialog(
      context, ref.watch(genderStateProvider),
      onGenderSelection: (String value) {
        ref.watch(genderStateProvider.notifier).update((state) => value);
      },
        onSizeSelection: (String value) {
        ref.watch(sizeStateProvider.notifier).update((state) => value);
      }
    );
  }

  void _showSortBottomSheetDialog(
      BuildContext context,
      String gender,
      {required ValueChanged<String> onGenderSelection,
        required ValueChanged<String> onSizeSelection}) {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0)
        )
      ),
      builder: (BuildContext context) => SortModalBottomSheetDialog(
        gender: gender,
        onGenderSelection: onGenderSelection,
        onSizeSelection: onSizeSelection
      )
    );
  }
}

final controller = Controller();