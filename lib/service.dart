import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/pages/models.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Service {
  final _sellOrders = FirebaseFirestore.instance.collection('products');
  final _storage = FirebaseStorage.instance.ref().child('images');
  final Reference displayPictureRef = FirebaseStorage.instance.ref().child('profile_pictures');

  Stream<List<Product>> sellOrderStream() {
    return _sellOrders.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) {
          final buyersId = ((doc.data()['buyersId'] ?? {}) as Map).map((k, v) =>
              MapEntry(k.toString(), (v as Map).map((k, v) =>
                  MapEntry(k.toString(), (v as Timestamp)))));
          return Product.fromJson(doc.data());
        }).toList());
  }
}

final Service service = Service();