import 'package:ecommerce/controller.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
            ref.watch(productsStreamProvider).when(
              data: (data) => Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = data.elementAt(index);
                      return SearchCard(
                        product: product,
                        onPressed: () => controller.onProductSelect(context, ref, product),
                      );
                    },
                  ),
                ),
              ),
              error: (_, __) => const Center(child: Text('Error here')),
              loading: () => const Center(child: Text('Error here'))
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
