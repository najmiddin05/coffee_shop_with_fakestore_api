// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:bloc/bloc.dart';

// import 'package:shop_app/domain/model/cart_item.dart';
// import 'package:shop_app/domain/model/cart_model.dart';
// import 'package:shop_app/domain/model/product_model.dart';

// class CartController extends Cubit<Cart> {
//   Cart state1;
//   CartController(
//     this.state1,
//   ) : super(
//           Cart(id: 1, items: []),
//         );

//   // Cart get state1 => state;

//   void addToCard({required Product product, required int quantity}) {
//     final isExist = state.items.any((element) => element.id == product.id);
//     if (isExist) {
//       final item =
//           state.items.firstWhere((element) => element.id == product.id);
//       if (quantity == 1) {
//         item.quantity++;
//       } else if (quantity == -1 && item.quantity > 0) {
//         item.quantity--;
//       }

//       item.total = (item.quantity * item.product.price) * 1;
//       if (item.quantity == 0) {
//         state.items.remove(item);
//       }
//     } else if (quantity == 1) {
//       final cartItem = CartItem(id: product.id, product: product);
//       state.items.add(cartItem);
//     }
//     state1 = state.copyWith(items: state.items);
//   }

//   @override
//   void emit(Cart state) {
//     super.emit(state);
//   }

//   Cart get getCart => state1;
// }

import 'package:bloc/bloc.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/cart_item.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/cart_model.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/product_model.dart';

class CartState {
  Cart cart;

  CartState(this.cart);
}

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  void addToCard({required Product product, required int quantity}) {
    final isExist = state.cart.items.any((element) => element.id == product.id);
    if (isExist) {
      final item =
          state.cart.items.firstWhere((element) => element.id == product.id);
      if (quantity == 1) {
        item.quantity++;
      } else if (quantity == -1 && item.quantity > 0) {
        item.quantity--;
      }

      item.total = item.quantity * item.product.price * 1;
      if (item.quantity == 0) {
        state.cart.items.remove(item);
      }
    } else if (quantity == 1) {
      final cartItem = CartItem(id: product.id, product: product);
      state.cart.items.add(cartItem);
    }

    emit(CartState(state.cart.copyWith(items: state.cart.items)));
  }
}
