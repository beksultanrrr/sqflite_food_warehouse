

part of  'main_bloc.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final List<ProductModel> products;
  final ProductStatus status;

  const ProductState({
    this.products = const [],
    this.status = ProductStatus.initial,
  });

  @override
  List<Object?> get props => [products, status];

  bool get isInitial => status == ProductStatus.initial;
  bool get isLoading => status == ProductStatus.loading;
  bool get isSuccess => status == ProductStatus.success;
  bool get isFailure => status == ProductStatus.failure;

  ProductState copyWith({
    List<ProductModel>? products,
    ProductStatus? status,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }


}