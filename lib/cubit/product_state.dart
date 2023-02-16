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
  final ProductModel productModel;

  ResponseProductInitial({required this.productModel});
}
