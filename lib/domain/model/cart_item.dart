import 'package:coffee_shop_with_fakestore_api/domain/model/product_model.dart';

class CartItem {
  final int id;
  int quantity;
  double total;
  final Product product;

  CartItem({
    required this.id,
    this.quantity = 1,
    required this.product,
  }) : total = (quantity * product.price) * 1;

  @override
  String toString() {
    return "CartItem{$product - $quantity}; ";
  }

  CartItem copywith({
    int? id,
    int? quantity,
    Product? product,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
