import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_showcase/constants.dart';

import '../models/product_details_model.dart';

class ProductDetailsRepo {
  Future<ProductDetailsModel> getProducts(String slug) async {
    final constants = Constants();

    final url = '${constants.baseUrl}product-details/$slug/';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print(json);

      return ProductDetailsModel.fromJson(json);
    } else {
      throw 'something wnent wrong ${response.statusCode}';
    }
  }
}
