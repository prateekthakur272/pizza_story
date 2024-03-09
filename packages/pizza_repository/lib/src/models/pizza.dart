import 'macros.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza(
      {required this.pizzaId,
      required this.name,
      required this.description,
      required this.discount,
      required this.isVeg,
      required this.macros,
      required this.picture,
      required this.price,
      required this.spicy});

  Map<String, dynamic> toMap() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.toMap()
    };
  }

  static Pizza fromMap(Map<String, dynamic> map) {
    return Pizza(
        pizzaId: map['pizzaId'],
        name: map['name'],
        description: map['description'],
        discount: map['discount'],
        isVeg: map['isVeg'],
        macros: Macros.fromMap(map['macros']),
        picture: map['picture'],
        price: map['price'],
        spicy: map['spicy']);
  }
}
