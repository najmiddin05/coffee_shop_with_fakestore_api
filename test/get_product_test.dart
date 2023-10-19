import 'dart:convert';

import 'package:coffee_shop_with_fakestore_api/app.dart';
import 'package:coffee_shop_with_fakestore_api/core/api.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("description", () {
    test("test product all", () async {
      final response = await network.methodGet(api: Api.apiProduct);
      // debugPrint(response);
      final json = jsonDecode(response!);
      final getJson = json as List<dynamic>;
      final parseJsonAsMap = getJson
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
      debugPrint(parseJsonAsMap.toString());
      expect(parseJsonAsMap.first, const TypeMatcher<Product>());
    });
    test("test product", () async {
      final response = await network.methodGet(api: Api.apiProduct, id: 1);
      // debugPrint(response);
      final json = jsonDecode(response!);
      final getJson = json as Map<String, Object?>;
      final getData = Product.fromJson(getJson);
      expect(getData, const TypeMatcher<Product>());
      // final parseJsonAsMap = getJson
      //     .map((e) => Product.fromJson(e as Map<String, dynamic>))
      //     .toList();
      // debugPrint(parseJsonAsMap.toString());
      // expect(parseJsonAsMap.first, const TypeMatcher<Product>());
    });
  });
}
