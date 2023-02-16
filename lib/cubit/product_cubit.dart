import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';
import '../repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;
  ProductCubit(this._productRepo) : super(ProductInitial());

  Future<void> fetchProduct() async {
    emit(LoadingProductInitial());
    try {
      final response = await _productRepo.getProducts();
      emit(
        ResponseProductInitial(productModel: response),
      );
    } catch (e) {
      emit(
        ErrorProductInitial(
          errors: e.toString(),
        ),
      );
    }
  }
}
