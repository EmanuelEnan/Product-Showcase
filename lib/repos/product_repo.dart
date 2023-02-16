import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_showcase/constants.dart';

import '../models/product_model.dart';

class ProductRepo {
  Future<ProductModel> getProducts() async {
    final constants = Constants();

    final url =
        '${constants.baseUrl}?format=json&limit=10&offset=10&search=rice';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print(json);

      return ProductModel.fromJson(json);
    } else {
      throw 'something wnent wrong ${response.statusCode}';
    }
  }
}
