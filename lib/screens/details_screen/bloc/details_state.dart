part of 'details_bloc.dart';

enum DetailsStatus { initial, loading, success, failure }

class DetailsState extends Equatable {
  final ProductModel product;
  final List<ProductModel> productList;
  final DetailsStatus status;

  const DetailsState({
    required this.product,
    this.productList = const [],
    this.status = DetailsStatus.initial,
  });

  @override
  List<Object?> get props => [
        product,
        productList,
        status,
      ];

  bool get isInitial => status == DetailsStatus.initial;
  bool get isLoading => status == DetailsStatus.loading;
  bool get isSuccess => status == DetailsStatus.success;
  bool get isFailure => status == DetailsStatus.failure;

  DetailsState copyWith({
    ProductModel? product,
    List<ProductModel>? productList,
    DetailsStatus? status,
  }) {
    return DetailsState(
      productList: productList ?? this.productList,
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }
}
