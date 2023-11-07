import 'dart:math';
import 'package:ecommerce/pages/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navIndexStateProvider = StateProvider<int>((ref) => 0);

final currentCategoryStateProvider = StateProvider<String>((ref) {
  return ref.watch(categoriesStateProvider).first;
});

final trendingProductIndexStateProvider = StateProvider<int>((ref) => 0);

final selectedProductStateProvider = StateProvider<Product?>((ref) => null);

final prefsFutureProvider = FutureProvider<SharedPreferences>((ref) async => await SharedPreferences.getInstance());

final _productsStreamProvider = StreamProvider<List<Product>>((ref) async* {
  final List<Map<String, dynamic>> lst = [
    {
      "id": "a8819f1d-1a34-4952-a8b2-d3942191975b5Bit",
      "name": "Addidas Bag 2",
      "price": "\u20a63,000",
      "size": "Medium",
      "color": "Black",
      "qty": 8,
      "gender": "All",
      "category": "bags",
      "images": [
        "images/addidas bag 2.jpg"
      ]
    },
    {
      "id": "5705288b-3f74-4aa5-8cc6-4459060042f1KMI3",
      "name": "Addidas Bag",
      "price": "\u20a61,500",
      "size": "Small",
      "color": "White",
      "qty": 8,
      "gender": "Adult",
      "category": "bags",
      "images": [
        "images/addidas bag.jpg"
      ]
    },
    {
      "id": "618d9ae7-ec2a-4bbe-9c74-b0ddd93fb1e4cVZI",
      "name": "Addidas Rocksack",
      "price": "\u20a62,500",
      "size": "Large",
      "color": "Grey",
      "qty": 5,
      "gender": "Kid",
      "category": "bags",
      "images": [
        "images/addidas rocksack.jpg"
      ]
    },
    {
      "id": "b592cb5b-a815-4bba-9641-f797e7560b1dcs0h",
      "name": "Nike Bag 1",
      "price": "\u20a61,500",
      "size": "Extra large",
      "color": "Grey",
      "qty": 6,
      "gender": "Kid",
      "category": "bags",
      "images": [
        "images/nike bag 1.jpg"
      ]
    },
    {
      "id": "2e33cea6-3343-4af6-aa81-9a06fcef39ddEf6P",
      "name": "Nike Bag",
      "price": "\u20a61,500",
      "size": "Extra large",
      "color": "White",
      "qty": 8,
      "gender": "Women",
      "category": "bags",
      "images": [
        "images/nike bag.jpg"
      ]
    },
    {
      "id": "e57fc340-bfd7-4d2c-a706-b588e3a385d3bLk2",
      "name": "Rocksack",
      "price": "\u20a63,000",
      "size": "Small",
      "color": "White",
      "qty": 5,
      "gender": "Adult",
      "category": "bags",
      "images": [
        "images/rocksack.jpg"
      ]
    },
    {
      "id": "e28c2286-34e5-4530-b06d-f3d90f5732aeG8ez",
      "name": "Addidas Bottle",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "White",
      "qty": 2,
      "gender": "All",
      "category": "bottles",
      "images": [
        "images/addidas bottle.jpg"
      ]
    },
    {
      "id": "6c787e76-f687-4edf-b33d-daefe362e5ceRqF8",
      "name": "Addidas Red Bottle",
      "price": "\u20a63,000",
      "size": "Medium",
      "color": "Grey",
      "qty": 9,
      "gender": "Men",
      "category": "bottles",
      "images": [
        "images/addidas red bottle.jpg"
      ]
    },
    {
      "id": "b460867f-6ba5-4a47-93eb-fc9dd59c49b3msqL",
      "name": "Chelsea Bottle",
      "price": "\u20a61,000",
      "size": "Extra small",
      "color": "Black",
      "qty": 1,
      "gender": "Adult",
      "category": "bottles",
      "images": [
        "images/chelsea bottle.jpg"
      ]
    },
    {
      "id": "b3b2bd8c-6ea1-448f-ad8d-241a126a18f6nX7r",
      "name": "Man U Bottle",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "Black",
      "qty": 2,
      "gender": "Men",
      "category": "bottles",
      "images": [
        "images/Man U bottle.jpg"
      ]
    },
    {
      "id": "8fc219da-284b-4416-aff4-2e4e1cfad15bu3uJ",
      "name": "Real Madrid Bottle",
      "price": "\u20a61,000",
      "size": "Large",
      "color": "Black",
      "qty": 4,
      "gender": "All",
      "category": "bottles",
      "images": [
        "images/Real Madrid bottle.jpg"
      ]
    },
    {
      "id": "055dfcae-4706-4f60-802b-83b5901c8f2cPg2z",
      "name": "Addidas Face Cap",
      "price": "\u20a61,500",
      "size": "Large",
      "color": "Grey",
      "qty": 3,
      "gender": "Men",
      "category": "caps",
      "images": [
        "images/addidas face cap.jpg"
      ]
    },
    {
      "id": "685cb1d6-1f39-4f62-aa70-3baca87d6cf7xOF0",
      "name": "Grey Under Armour",
      "price": "\u20a61,000",
      "size": "Extra large",
      "color": "White",
      "qty": 10,
      "gender": "Kid",
      "category": "caps",
      "images": [
        "images/grey under armour.jpg"
      ]
    },
    {
      "id": "0a2d35d8-7aad-46bf-91a6-538d38c98538QOWl",
      "name": "Nike Face Cap",
      "price": "\u20a63,000",
      "size": "Medium",
      "color": "Grey",
      "qty": 6,
      "gender": "Kid",
      "category": "caps",
      "images": [
        "images/nike face cap.jpg"
      ]
    },
    {
      "id": "ba1c0aff-c194-48ec-86c1-3da19bf252eeMzz5",
      "name": "Under Armour Cap",
      "price": "\u20a61,000",
      "size": "Extra small",
      "color": "Black",
      "qty": 4,
      "gender": "Women",
      "category": "caps",
      "images": [
        "images/under armour cap.jpg"
      ]
    },
    {
      "id": "760d2a2c-ac65-4093-84d7-6b47d66f019fCbNS",
      "name": "Under Armour White",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "Brown",
      "qty": 9,
      "gender": "Adult",
      "category": "caps",
      "images": [
        "images/under armour white.jpg"
      ]
    },
    {
      "id": "f1fae6d9-f36b-46f4-8d0d-9bfcbd146e8ahIIf",
      "name": "Addidas Hoodie",
      "price": "\u20a62,000",
      "size": "Extra small",
      "color": "Blue",
      "qty": 9,
      "gender": "Women",
      "category": "clothes",
      "images": [
        "images/addidas hoodie.jpg"
      ]
    },
    {
      "id": "6375c6cf-b0ca-4036-a66e-38ec39ffa346xyw8",
      "name": "Black Sleeve Less Sports Top",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "Grey",
      "qty": 7,
      "gender": "Kid",
      "category": "clothes",
      "images": [
        "images/Black sleeve less sports top.jpg"
      ]
    },
    {
      "id": "b93ff6b4-9b13-4447-bc2b-482304dafd6dIK5w",
      "name": "Black Sports Vest",
      "price": "\u20a62,500",
      "size": "Extra large",
      "color": "White",
      "qty": 10,
      "gender": "Adult",
      "category": "clothes",
      "images": [
        "images/Black sports vest.jpg"
      ]
    },
    {
      "id": "3048d227-00ba-492f-9704-922322ae68eeSIVr",
      "name": "Black Vest",
      "price": "\u20a62,000",
      "size": "Large",
      "color": "Brown",
      "qty": 9,
      "gender": "Women",
      "category": "clothes",
      "images": [
        "images/Black vest.jpg"
      ]
    },
    {
      "id": "8dcdf2dd-7b0b-40e8-933e-773514e9d28cjU2E",
      "name": "Longsleeve Sports Vest",
      "price": "\u20a62,000",
      "size": "Medium",
      "color": "Grey",
      "qty": 9,
      "gender": "Kid",
      "category": "clothes",
      "images": [
        "images/Longsleeve sports vest.jpg"
      ]
    },
    {
      "id": "c4eeba23-1c1f-48dc-8fc6-9e12a4f2a44cTUfe",
      "name": "Navy Blue Long Sleeve Sports Wear",
      "price": "\u20a62,000",
      "size": "Medium",
      "color": "Blue",
      "qty": 2,
      "gender": "Adult",
      "category": "clothes",
      "images": [
        "images/Navy Blue long sleeve sports wear.jpg"
      ]
    },
    {
      "id": "45cdb57e-7288-4dba-9d82-b1a60718a2a9OPO5",
      "name": "Red And Yellow Sports Top",
      "price": "\u20a63,000",
      "size": "Extra small",
      "color": "Black",
      "qty": 2,
      "gender": "Adult",
      "category": "clothes",
      "images": [
        "images/Red and yellow sports top.jpg"
      ]
    },
    {
      "id": "c8d43c5a-502c-41e4-8952-6aa7f1aa0e84w1zn",
      "name": "Red Long Sleeve Sport Wear",
      "price": "\u20a62,000",
      "size": "Large",
      "color": "Brown",
      "qty": 9,
      "gender": "Men",
      "category": "clothes",
      "images": [
        "images/red long sleeve sport wear.jpg"
      ]
    },
    {
      "id": "b3f683d1-72dc-45e7-9bb3-9044309efca9jb3D",
      "name": "Red Sports Vest",
      "price": "\u20a62,500",
      "size": "Extra large",
      "color": "Brown",
      "qty": 5,
      "gender": "Kid",
      "category": "clothes",
      "images": [
        "images/Red sports vest.jpg"
      ]
    },
    {
      "id": "662653b4-cce7-4215-b507-810a4fdc03afCRho",
      "name": "Sport T-Shirt",
      "price": "\u20a61,500",
      "size": "Extra large",
      "color": "Brown",
      "qty": 7,
      "gender": "Adult",
      "category": "clothes",
      "images": [
        "images/sport T-Shirt.jpg"
      ]
    },
    {
      "id": "e03fbf3b-f3b7-42a2-8090-8b0b5c444673BR0D",
      "name": "Sports Top",
      "price": "\u20a63,000",
      "size": "Large",
      "color": "Black",
      "qty": 6,
      "gender": "Kid",
      "category": "clothes",
      "images": [
        "images/Sports top.jpg"
      ]
    },
    {
      "id": "36ac70a6-7205-40a7-b648-6a8ee900196a13nZ",
      "name": "Sports Vest",
      "price": "\u20a62,000",
      "size": "Extra small",
      "color": "Grey",
      "qty": 7,
      "gender": "Kid",
      "category": "clothes",
      "images": [
        "images/Sports vest.jpg"
      ]
    },
    {
      "id": "a6104bf6-c367-451e-bb57-8d2c3ab5cfafeQwZ",
      "name": "Tracksuit",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "Blue",
      "qty": 2,
      "gender": "All",
      "category": "clothes",
      "images": [
        "images/tracksuit.jpg"
      ]
    },
    {
      "id": "3fd65022-03ff-44b8-a5b1-477273a9058f7rpl",
      "name": "Addidas 2",
      "price": "\u20a62,000",
      "size": "Small",
      "color": "White",
      "qty": 6,
      "gender": "Men",
      "category": "shoes",
      "images": [
        "images/addidas 2.jpg"
      ]
    },
    {
      "id": "375f18d2-0c39-469c-8211-77bd6ce5825axvLp",
      "name": "Addidas Female Swift Run",
      "price": "\u20a62,500",
      "size": "Medium",
      "color": "Grey",
      "qty": 1,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/addidas female swift run.jpg"
      ]
    },
    {
      "id": "41b307b5-3b54-4ec4-a1d9-6625caa070df6Orf",
      "name": "Addidas Female Tubular",
      "price": "\u20a63,000",
      "size": "Extra large",
      "color": "Grey",
      "qty": 5,
      "gender": "Adult",
      "category": "shoes",
      "images": [
        "images/addidas female tubular.jpg"
      ]
    },
    {
      "id": "6e1b1228-9737-4e52-af41-a1c0c2db3e93lpIM",
      "name": "Addidas Nmd",
      "price": "\u20a61,500",
      "size": "Extra small",
      "color": "Black",
      "qty": 9,
      "gender": "Women",
      "category": "shoes",
      "images": [
        "images/addidas nmd.jpg"
      ]
    },
    {
      "id": "a4b94eed-73da-47df-9ceb-f446f3ae13012XNr",
      "name": "Addidas Trainers",
      "price": "\u20a62,000",
      "size": "Small",
      "color": "Grey",
      "qty": 2,
      "gender": "Men",
      "category": "shoes",
      "images": [
        "images/addidas trainers.jpg"
      ]
    },
    {
      "id": "473327ce-294b-4492-a2d6-3d3de347a8c7nARP",
      "name": "Air Force Second",
      "price": "\u20a63,000",
      "size": "Medium",
      "color": "Grey",
      "qty": 10,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/air force second.jpg"
      ]
    },
    {
      "id": "8d53ca44-11df-40bd-b5dc-a356e95358584ucA",
      "name": "Air Jordans 2",
      "price": "\u20a63,000",
      "size": "Extra large",
      "color": "Grey",
      "qty": 4,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/air jordans 2.jpg"
      ]
    },
    {
      "id": "39e5375a-8c3b-4341-9918-c4d18f41f6ca8Aqt",
      "name": "Air Jordans",
      "price": "\u20a61,000",
      "size": "Large",
      "color": "White",
      "qty": 6,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/air jordans.jpg"
      ]
    },
    {
      "id": "86ba22cd-4095-4332-a38c-055babfd5ae7JGl0",
      "name": "Air Max 95",
      "price": "\u20a61,000",
      "size": "Small",
      "color": "White",
      "qty": 7,
      "gender": "Kid",
      "category": "shoes",
      "images": [
        "images/air max 95.jpg"
      ]
    },
    {
      "id": "45de53b1-2868-41ad-adee-2209cc97bec0WpnJ",
      "name": "Air Max",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "Blue",
      "qty": 4,
      "gender": "Men",
      "category": "shoes",
      "images": [
        "images/air max.jpg"
      ]
    },
    {
      "id": "50965060-a662-46fa-8f6f-b6e7f9a29649mcgr",
      "name": "Female Trainers 2",
      "price": "\u20a61,500",
      "size": "Extra small",
      "color": "Grey",
      "qty": 9,
      "gender": "Kid",
      "category": "shoes",
      "images": [
        "images/female trainers 2.jpg"
      ]
    },
    {
      "id": "21521ed6-db50-4b4f-8adc-9cae8f0935938d6A",
      "name": "Female Trainers 3",
      "price": "\u20a61,000",
      "size": "Small",
      "color": "Brown",
      "qty": 1,
      "gender": "Men",
      "category": "shoes",
      "images": [
        "images/female trainers 3.jpg"
      ]
    },
    {
      "id": "ea5c8221-d5af-4940-aaf0-39d130ef2238CtKM",
      "name": "Female Trainers 4",
      "price": "\u20a61,500",
      "size": "Small",
      "color": "Black",
      "qty": 1,
      "gender": "Kid",
      "category": "shoes",
      "images": [
        "images/female trainers 4.jpg"
      ]
    },
    {
      "id": "848c311d-753a-419b-b7e2-87d9fa6e32549JS6",
      "name": "Female Trainers",
      "price": "\u20a61,000",
      "size": "Extra small",
      "color": "White",
      "qty": 6,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/female trainers.jpg"
      ]
    },
    {
      "id": "fea1b814-d626-4719-b6b7-0baea7e9e018gnR2",
      "name": "Kids Trainer 2",
      "price": "\u20a61,000",
      "size": "Medium",
      "color": "Brown",
      "qty": 4,
      "gender": "Kid",
      "category": "shoes",
      "images": [
        "images/kids trainer 2.jpg"
      ]
    },
    {
      "id": "7d08fb2a-33f1-4a5a-ad51-f7d3e8b29b06BKS4",
      "name": "Kids Trainers 3",
      "price": "\u20a61,000",
      "size": "Small",
      "color": "White",
      "qty": 5,
      "gender": "Kid",
      "category": "shoes",
      "images": [
        "images/kids trainers 3.jpg"
      ]
    },
    {
      "id": "543868ea-8253-4d68-b602-0ce6357a3faaPuiF",
      "name": "Kids Trainers 4",
      "price": "\u20a61,500",
      "size": "Extra large",
      "color": "Brown",
      "qty": 8,
      "gender": "Adult",
      "category": "shoes",
      "images": [
        "images/kids trainers 4.jpg"
      ]
    },
    {
      "id": "0919d469-505a-4a96-889c-8f933a81652eWsqo",
      "name": "Kids Trainers 5",
      "price": "\u20a62,500",
      "size": "Medium",
      "color": "Brown",
      "qty": 1,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/kids trainers 5.jpg"
      ]
    },
    {
      "id": "a5d16aac-37d6-4622-a0d5-61bf345f934a4pnt",
      "name": "Kids Trainers 6",
      "price": "\u20a63,000",
      "size": "Extra small",
      "color": "Blue",
      "qty": 10,
      "gender": "Men",
      "category": "shoes",
      "images": [
        "images/kids trainers 6.jpg"
      ]
    },
    {
      "id": "ab39951a-aa2d-4fb9-8ac0-1d8d621cd3cbUqrJ",
      "name": "Kids Trainers",
      "price": "\u20a63,000",
      "size": "Extra large",
      "color": "Grey",
      "qty": 1,
      "gender": "Women",
      "category": "shoes",
      "images": [
        "images/kids trainers.jpg"
      ]
    },
    {
      "id": "a50ff28f-d848-4666-8a60-1fa0cbb78b3fvdp6",
      "name": "Nmd 2",
      "price": "\u20a63,000",
      "size": "Medium",
      "color": "Brown",
      "qty": 7,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/nmd 2.jpg"
      ]
    },
    {
      "id": "74b4a828-9310-4ed4-9c46-fb220a347d31kL4c",
      "name": "Nmd",
      "price": "\u20a62,500",
      "size": "Medium",
      "color": "Blue",
      "qty": 4,
      "gender": "All",
      "category": "shoes",
      "images": [
        "images/nmd.jpg"
      ]
    },
    {
      "id": "013f8e97-4cd0-4f73-9936-e23ee2885d1f6Cgk",
      "name": "Men Watch 1",
      "price": "\u20a61,000",
      "size": "Small",
      "color": "Black",
      "qty": 3,
      "gender": "Adult",
      "category": "wristwatch",
      "images": [
        "images/men watch 1.jpg"
      ]
    },
    {
      "id": "db67d56c-89cd-4844-9161-cf01e85a17daa4VC",
      "name": "Men Watch 2",
      "price": "\u20a61,500",
      "size": "Large",
      "color": "White",
      "qty": 9,
      "gender": "Men",
      "category": "wristwatch",
      "images": [
        "images/men watch 2.jpg"
      ]
    },
    {
      "id": "afae73b9-b4d1-43d1-8fb5-6762471f983bM03P",
      "name": "Men Watch 3",
      "price": "\u20a61,500",
      "size": "Medium",
      "color": "Brown",
      "qty": 7,
      "gender": "Kid",
      "category": "wristwatch",
      "images": [
        "images/men watch 3.jpg"
      ]
    },
    {
      "id": "8881cfe8-f4e7-4b79-bcc4-d1bef1aefe63MCPx",
      "name": "Men Watch 4",
      "price": "\u20a63,000",
      "size": "Extra large",
      "color": "Brown",
      "qty": 3,
      "gender": "Adult",
      "category": "wristwatch",
      "images": [
        "images/men watch 4.jpg"
      ]
    },
    {
      "id": "da896ff0-e623-4a7f-8588-927c43d6e5c0sAXY",
      "name": "Men Watch 5",
      "price": "\u20a62,000",
      "size": "Medium",
      "color": "Blue",
      "qty": 1,
      "gender": "Kid",
      "category": "wristwatch",
      "images": [
        "images/men watch 5.jpg"
      ]
    },
    {
      "id": "560e8ed9-b003-4be2-97c9-13f7753ee3bcmXrH",
      "name": "Men Watch",
      "price": "\u20a62,000",
      "size": "Extra small",
      "color": "Blue",
      "qty": 5,
      "gender": "Men",
      "category": "wristwatch",
      "images": [
        "images/men watch.jpg"
      ]
    }
  ];
  final cartIds = ref.watch(prefsFutureProvider).value?.getStringList('cartIds')??[];
  final List<Product> value = lst.map((e) {
    final lst = cartIds.where((element) => element.split('//').first == e['id']);
    String? count;
    if (lst.isNotEmpty && lst.first.contains('//')) {
      count = lst.first.split('//').last;
    }
    return Product.fromJson(e).copyWith(count: count);
  }).toList();
  value.shuffle();
  yield value;
});

final productsStreamProvider = StreamProvider<List<Product>>((ref) async* {
  final category = ref.watch(currentCategoryStateProvider);
  final categories = ref.watch(categoriesStateProvider);
  final products = ref.watch(_productsStreamProvider).value??[];
  yield products.where((product) => category == categories.first || product.category == category).toList();
});

final seeAllStreamProvider = StreamProvider<List<Product>>((ref) async* {
  final products = ref.watch(productsStreamProvider).value??[];
  final gender = ref.watch(genderStateProvider);
  final size = ref.watch(sizeStateProvider);
  yield products.where((product) {
    return (
      gender == genders.first || product.gender == gender) && (
      size == sizes.first || product.size == size
    );
  }).toList();
});

final categoriesStateProvider = StateProvider<List<String>>((ref) {
  return ['All products', ...?ref.watch(_productsStreamProvider).value?.map((e) => e.category).toSet()];
});

final trendingsStateProvider = StateProvider<List<Product>>((ref) {
  List<Product> originalList = ref.watch(productsStreamProvider).value??[];
  List<Product> trendingList = List.from(originalList)..shuffle();
  return trendingList.sublist(0, min(10, trendingList.length));
});

final favoritesStateProvider = StateProvider<List<Product>>((ref) {
  final products = ref.watch(productsStreamProvider).value??[];
  final favourites = ref.watch(prefsFutureProvider).value?.getStringList('favoriteIds')??[];
  return favourites.map((id) => products.where((p) => p.id == id).first).toList();
});

final cartsStateProvider = StateProvider<List<Product>>((ref) {
  final products = ref.watch(productsStreamProvider).value??[];
  final carts = ref.watch(prefsFutureProvider).value?.getStringList('cartIds')??[];
  return carts.map((id) => products
    .where((p) => p.id == id.split('//').first).first
      .copyWith(count: id.split('//').last)).toList();
});

final genders = ['All', 'Men', 'Women', 'Kid', 'Adult'];
final sizes = ['All', 'Extra large', 'Large', 'Medium', 'Small', 'Extra small'];

final genderStateProvider = StateProvider<String>((ref) => genders.first);
final sizeStateProvider = StateProvider<String>((ref) => sizes.first);