// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class EproductList {
  final List<Eproduct> camera;
  final List<Eproduct> phone;
  final List<Eproduct> computer;
  final List<Eproduct> watch;
  final List<Eproduct> popular;
  final List<Eproduct> mostpopular;
  final List<Eproduct> recents;
  EproductList({
    required this.camera,
    required this.phone,
    required this.computer,
    required this.watch,
    required this.popular,
    required this.mostpopular,
    required this.recents,
  });

  EproductList copyWith({
    List<Eproduct>? camera,
    List<Eproduct>? phone,
    List<Eproduct>? computer,
    List<Eproduct>? watch,
    List<Eproduct>? popular,
    List<Eproduct>? mostpopular,
    List<Eproduct>? recents,
  }) {
    return EproductList(
      camera: camera ?? this.camera,
      phone: phone ?? this.phone,
      computer: computer ?? this.computer,
      watch: watch ?? this.watch,
      popular: popular ?? this.popular,
      mostpopular: mostpopular ?? this.mostpopular,
      recents: recents ?? this.recents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'camera': camera.map((x) => x.toMap()).toList(),
      'phone': phone.map((x) => x.toMap()).toList(),
      'computer': computer.map((x) => x.toMap()).toList(),
      'watch': watch.map((x) => x.toMap()).toList(),
      'popular': popular.map((x) => x.toMap()).toList(),
      'mostpopular': mostpopular.map((x) => x.toMap()).toList(),
      'recents': recents.map((x) => x.toMap()).toList(),
    };
  }

  factory EproductList.fromMap(Map<String, dynamic> map) {
    return EproductList(
      camera: List<Eproduct>.from(
        (map['camera'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      phone: List<Eproduct>.from(
        (map['phone'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      computer: List<Eproduct>.from(
        (map['computer'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      watch: List<Eproduct>.from(
        (map['watch'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      popular: List<Eproduct>.from(
        (map['popular'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      mostpopular: List<Eproduct>.from(
        (map['mostpopular'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      recents: List<Eproduct>.from(
        (map['recents'] as List<dynamic>).map<Eproduct>(
          (x) => Eproduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory EproductList.fromJson(String source) =>
      EproductList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EproductList(camera: $camera, phone: $phone, computer: $computer, watch: $watch, popular: $popular, mostpopular: $mostpopular, recents: $recents)';
  }

  @override
  bool operator ==(covariant EproductList other) {
    if (identical(this, other)) return true;

    return listEquals(other.camera, camera) &&
        listEquals(other.phone, phone) &&
        listEquals(other.computer, computer) &&
        listEquals(other.watch, watch) &&
        listEquals(other.popular, popular) &&
        listEquals(other.mostpopular, mostpopular) &&
        listEquals(other.recents, recents);
  }

  @override
  int get hashCode {
    return camera.hashCode ^
        phone.hashCode ^
        computer.hashCode ^
        watch.hashCode ^
        popular.hashCode ^
        mostpopular.hashCode ^
        recents.hashCode;
  }
}
