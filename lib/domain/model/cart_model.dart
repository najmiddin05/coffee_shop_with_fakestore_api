// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_shop_with_fakestore_api/domain/model/cart_item.dart';
import 'package:flutter/foundation.dart';

class Cart {
  final int id;
  List<CartItem> items;
  double total;

  Cart({
    required this.id,
    required this.items,
  }) : total = items.fold(
            0.0, (previousValue, element) => previousValue + element.total);

  Cart copyWith({int? id, List<CartItem>? items}) {
    return Cart(id: id ?? this.id, items: items ?? this.items);
  }

  @override
  String toString() {
    return "Cart{total: $total, items: $items}";
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.items, items) &&
        other.total == total;
  }

  @override
  int get hashCode => Object.hash(id, items, total);
}
