import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/src/pizza_repo.dart';
import 'models/models.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  @override
  Future<List<Pizza>> getPizzas() async {
    print('getting pizzas');
    try {
      final docs = (await pizzaCollection.get()).docs;
      return docs.map((doc) => Pizza.fromMap(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
