import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/app/model/productdata/list_item.dart';
import 'package:flutter_ecommerce/app/model/productdata/product.dart';

class CartServices {
  CartServices._internal();
  static final CartServices _instance = CartServices._internal();
  factory CartServices() => _instance;

  final ValueNotifier<List<ListItem>> cartNotifier = ValueNotifier([]);

  void addProduct(Product product) {
    addProductWithQuantity(product, 1);
  }

  void addProductWithQuantity(Product product, int quantityToAdd) {
    if (quantityToAdd <= 0) {
      return;
    }

    final List<ListItem> currentCart = List.from(cartNotifier.value);
    final index = currentCart.indexWhere(
      (cartitem) => cartitem.product.id == product.id,
    );

    if (index != -1) {
      int newQuantity = currentCart[index].quantity + quantityToAdd;
      currentCart[index].quantity = (newQuantity >= product.stock)
          ? product.stock
          : newQuantity;
    } else {
      if (product.stock >= quantityToAdd) {
        currentCart.add(ListItem(product: product, quantity: quantityToAdd));
      }
    }
    cartNotifier.value = currentCart;
  }

  void updateQuantity(String productid, int addQuantity) {
    final List<ListItem> currentCart = List.from(cartNotifier.value);
    final index = currentCart.indexWhere(
      (cartItem) => cartItem.product.id == productid,
    );
    if (index != -1) {
      if (addQuantity > 0 && addQuantity <= currentCart[index].product.stock) {
        currentCart[index].quantity = addQuantity;
      } else if (addQuantity == 0) {
        currentCart.removeAt(index);
      }
    }
    cartNotifier.value = currentCart;
  }

  double get totalCost {
    return cartNotifier.value.fold(0, (sum, item) => sum + item.totalprice);
  }
}
