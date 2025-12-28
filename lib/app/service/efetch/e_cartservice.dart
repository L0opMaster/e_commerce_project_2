import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/list_eitem.dart';

class ECartservice {
  ECartservice._internal();
  static final ECartservice _instance = ECartservice._internal();
  factory ECartservice() => _instance;
  final ValueNotifier<List<ListEitem>> cartNotifi = ValueNotifier([]);

  void addProduct(Eproduct product) {
    addProductWithQuantity(product, 1);
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
  }
}
