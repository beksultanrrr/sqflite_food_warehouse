// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_product_alert_bloc.dart';

enum UpdateProductAlertStatus { initial, loading, success, failure }

class UpdateProductAlertState extends Equatable {
  final ProductModel product;
  final UpdateProductAlertStatus status;

  const UpdateProductAlertState({
    required this.product,
    this.status = UpdateProductAlertStatus.initial,
  });

  @override
  List<Object?> get props => [product, status];

  bool get isInitial => status == UpdateProductAlertStatus.initial;
  bool get isLoading => status == UpdateProductAlertStatus.loading;
  bool get isSuccess => status == UpdateProductAlertStatus.success;
  bool get isFailure => status == UpdateProductAlertStatus.failure;


  UpdateProductAlertState copyWith({
    ProductModel? product,
    UpdateProductAlertStatus? status,
  }) {
    return UpdateProductAlertState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }
}
