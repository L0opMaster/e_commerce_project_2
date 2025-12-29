import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/list_eitem.dart';

class ECartservice {
  ECartservice._internal();
  static final ECartservice _instance = ECartservice._internal();
  factory ECartservice() => _instance;
  final ValueNotifier<List<ListEitem>> cartNotifi = ValueNotifier([]);
  final ValueNotifier<int> cartBadge = ValueNotifier(0);

  void addProduct(Eproduct product) {
    addProductWithQuantity(product, 1);
  }

  void clearBadge() {
    cartBadge.value = 0;
  }

  void addProductWithQuantity(Eproduct product, int quantityToAdd) {
    if (quantityToAdd < 0) {
      return;
    }

    final List<ListEitem> currentitem = List.from(cartNotifi.value);
    final index = currentitem.indexWhere(
      (item) => item.eproduct.id == product.id,
    );
    if (index != -1) {
      int newQuantity = currentitem[index].quantity + quantityToAdd;
      currentitem[index].quantity = (newQuantity >= product.stock)
          ? product.stock
          : newQuantity;
    } else {
      if (product.stock >= quantityToAdd) {
        currentitem.add(ListEitem(eproduct: product, quantity: quantityToAdd));
      }
    }
    cartNotifi.value = currentitem;
    cartBadge.value += 1;
  }

  void removeProduct(String productid) {
    final List<ListEitem> currentCart = List.from(cartNotifi.value);
    currentCart.removeWhere((item) => item.eproduct.id == productid);
    cartNotifi.value == currentCart;
  }

  void updateQuantity(String productId, int quantity) {
    final List<ListEitem> currentItem = List.from(cartNotifi.value);
    final index = currentItem.indexWhere(
      (item) => item.eproduct.id == productId,
    );
    if (index != -1) {
      if (quantity > 0 && quantity <= currentItem[index].eproduct.stock) {
        currentItem[index].quantity = quantity;
      } else if (quantity == 0) {
        currentItem.removeAt(index);
      }
    }
    cartNotifi.value = currentItem;
  }

  void clearCart() {
    cartNotifi.value = [];
  }

  double get totalCost {
    return cartNotifi.value.fold(0, (sum, item) => sum + item.totalprice);
  }
}
