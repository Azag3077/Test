import 'dart:math';
import 'package:ecommerce/controller.dart';
import 'package:ecommerce/providers.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavPage extends ConsumerWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesStateProvider).reversed;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Favourites',
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: favorites.isNotEmpty ?
        ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          final product = favorites.elementAt(index);
          return FavCard(
            product: product,
            onPressed: () => controller.onProductSelect(context, ref, product),
            onDislike: () => controller.onFavourite(context, ref, product),
          );
        },
      ) :
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('You do not have any favourite item.'),
          ),
        ),
    );
  }
}

class Azag extends ConsumerStatefulWidget {
  const Azag({Key? key}) : super(key: key);

  @override
  ConsumerState<Azag> createState() => _AzagState();
}

class _AzagState extends ConsumerState<Azag> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> items = List.generate(10, (index) => 'List item $index');


  @override
  void initState() {
    items = List.generate(10, (index) => 'List item $index');
    // items = ref.watch(favoritesStateProvider).map((e) => e.name).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List Demo'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return buildItem(items[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              removeItem(index);
            },
          ),
        ),
      ),
    );
  }

  void addItem() {
    int random = Random().nextInt(100);
    final newIndex = items.length;
    items.insert(newIndex, 'Item $random');
    _listKey.currentState?.insertItem(newIndex);
  }

  void removeItem(int index) {
    final removedItem = items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
          (context, animation) {
        return buildItem(removedItem, animation, index);
      },
    );
  }
}
