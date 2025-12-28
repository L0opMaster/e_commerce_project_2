// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class ListEitem {
  final Eproduct eproduct;
  int quantity;
  ListEitem({required this.eproduct, required this.quantity});
  double get totalprice => eproduct.price * quantity;

  ListEitem copyWith({Eproduct? eproduct, int? quantity}) {
    return ListEitem(
      eproduct: eproduct ?? this.eproduct,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eproduct': eproduct.toMap(),
      'quantity': quantity,
    };
  }

  factory ListEitem.fromMap(Map<String, dynamic> map) {
    return ListEitem(
      eproduct: Eproduct.fromMap(map['eproduct'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListEitem.fromJson(String source) =>
      ListEitem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListEitem(eproduct: $eproduct, quantity: $quantity)';

  @override
  bool operator ==(covariant ListEitem other) {
    if (identical(this, other)) return true;

    return other.eproduct == eproduct && other.quantity == quantity;
  }

  @override
  int get hashCode => eproduct.hashCode ^ quantity.hashCode;
}
