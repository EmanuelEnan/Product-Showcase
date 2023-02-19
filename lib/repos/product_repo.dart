import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_showcase/constants.dart';

import '../models/product_model.dart';

class ProductRepo {
  Future<List<ProductModel>> getProducts(int page) async {
    final constants = Constants();

    final url =
        '${constants.baseUrl}product/search-suggestions/?format=json&limit=10&offset=${page + 10}&search=rice';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonResponse = '[${response.body}]';
      List json = jsonDecode(jsonResponse) as List<dynamic>;
      print(json);

      return json.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw 'something wnent wrong ${response.statusCode}';
    }
  }
}
