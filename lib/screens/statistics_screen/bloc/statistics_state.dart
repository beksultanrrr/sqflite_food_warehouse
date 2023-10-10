part of 'statistics_bloc.dart';

enum StatisticsStatus { initial, loading, success, failure }

class StatisticsState extends Equatable {
  final StatisticsStatus status;

  final int countProduct;
  final double priceProduct;

  const StatisticsState({
    this.status = StatisticsStatus.initial,
    this.countProduct = 0,
    this.priceProduct = 0,
  });

  @override
  List<Object?> get props => [status, priceProduct, countProduct];

  bool get isInitial => status == StatisticsStatus.initial;
  bool get isLoading => status == StatisticsStatus.loading;
  bool get isSuccess => status == StatisticsStatus.success;
  bool get isFailure => status == StatisticsStatus.failure;

  StatisticsState copyWith({StatisticsStatus? status, int? countProduct, double? priceProduct}) {
    return StatisticsState(status: status ?? this.status, countProduct: countProduct ?? this.countProduct, priceProduct: priceProduct ?? this.priceProduct);
  }
}
