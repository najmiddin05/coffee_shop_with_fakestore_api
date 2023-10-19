import 'dart:convert';

import 'package:coffee_shop_with_fakestore_api/core/api.dart';
import 'package:coffee_shop_with_fakestore_api/domain/model/product_model.dart';
import 'package:http/http.dart';

abstract class Network {
  Future<String?> methodGet(
      {required String api, Object? id, String baseUrl = Api.baseUrl});
  List<Product> parseProductAll(String data);
  Product parseProductOne(String data);
}

class HttpNetwork implements Network {
  @override
  Future<String?> methodGet(
      {required String api, Object? id, String baseUrl = Api.baseUrl}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url);
      if (response.statusCode == 200) {
        return utf8.decoder.convert(response.bodyBytes);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  List<Product> parseProductAll(String data) {
    final json = jsonDecode(data);
    final getJson = json as List<dynamic>;
    final parseJsonAsMap = getJson
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
    return parseJsonAsMap;
  }

  @override
  Product parseProductOne(String data) {
    final json = jsonDecode(data);
    final getJson = json as Map<String, Object?>;
    final parseJsonAsMap = Product.fromJson(getJson);
    return parseJsonAsMap;
  }
}
