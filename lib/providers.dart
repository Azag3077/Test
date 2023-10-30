import 'package:ecommerce/pages/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navIndexStateProvider = StateProvider<int>((ref) => 0);

final productIndexStateProvider = StateProvider<int>((ref) => 0);

final trendingProductIndexStateProvider = StateProvider<int>((ref) => 0);

final selectedProductStateProvider = StateProvider<Product?>((ref) => null);

final favouritesFutureProvider = FutureProvider<List<String>?>((ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favorites');
});

final data = List<Product>.generate(12, (index) => Product(
  id: "id_$index",
  name: "name $index",
  price: "price",
  color: "color",
  gender: "gender",
  category: "category",
  images: ["images"],
));

// final azag = StreamProvider<List<Product>?>((ref) {
//   return service.sellOrderStream();
// });
