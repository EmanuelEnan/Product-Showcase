import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_showcase/models/product_details_model.dart';
import 'package:product_showcase/repos/product_details_repo.dart';

import '../models/product_model.dart';
import '../repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;
  final ProductDetailsRepo _detailsRepo;
  ProductCubit(this._productRepo, this._detailsRepo) : super(ProductInitial());

  int page = 10;

  void loadPosts() {
    if (state is LoadedProductInitial) return;

    final currentState = state;

    var oldProductModel = <ProductModel>[];

    if (currentState is ResponseProductInitial) {
      oldProductModel = currentState.productModel;
    }

    emit(
      LoadedProductInitial(oldProductModel, isFirstFetch: page == 10),
    );

    _productRepo.getProducts(page).then((newPosts) {
      page++;
      final posts = (state as LoadedProductInitial).oldProductModel;

      posts.addAll(newPosts);

      emit(
        ResponseProductInitial(productModel: posts),
      );
    });
  }

  // Future<void> fetchProduct() async {
  //   emit(LoadingProductInitial());
  //   try {
  //     final response = await _productRepo.getProducts();
  //     emit(
  //       ResponseProductInitial(productModel: response),
  //     );
  //   } catch (e) {
  //     emit(
  //       ErrorProductInitial(
  //         errors: e.toString(),
  //       ),
  //     );
  //   }
  // }

  Future<void> fetchProductDetails(String slug) async {
    emit(LoadingProductInitial());
    try {
      final response = await _detailsRepo.getProducts(slug);
      emit(
        ResponseDetailsInitial(detailsModel: response),
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
