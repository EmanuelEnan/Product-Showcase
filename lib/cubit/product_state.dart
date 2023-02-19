part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingProductInitial extends ProductState {}

class ErrorProductInitial extends ProductState {
  final String errors;

  ErrorProductInitial({required this.errors});
}

class ResponseProductInitial extends ProductState {
  final List<ProductModel> productModel;

  ResponseProductInitial({required this.productModel});
}

class ResponseDetailsInitial extends ProductState {
  final ProductDetailsModel detailsModel;

  ResponseDetailsInitial({required this.detailsModel});
}

class LoadedProductInitial extends ProductState {
  final List<ProductModel> oldProductModel;
  final bool isFirstFetch;

  LoadedProductInitial(this.oldProductModel, {this.isFirstFetch = false});
}
