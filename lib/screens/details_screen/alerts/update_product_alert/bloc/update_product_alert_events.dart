part of 'update_product_alert_bloc.dart';

abstract class UpdateProductAlertEvent extends Equatable {
  const UpdateProductAlertEvent();

  @override
  List<Object> get props => [];
}

class InitialUpdateProductAlertEvent extends UpdateProductAlertEvent {}

class TitleUpdateProductAlertEvent extends UpdateProductAlertEvent {
  final String value;
  const TitleUpdateProductAlertEvent(this.value);
}

class DescriptionUpdateProductAlertEvent extends UpdateProductAlertEvent {
  final String value;
  const DescriptionUpdateProductAlertEvent(this.value);
}

class ImgUrlUpdateProductAlertEvent extends UpdateProductAlertEvent {
  final String value;
  const ImgUrlUpdateProductAlertEvent(this.value);
}

class PriceUpdateProductAlertEvent extends UpdateProductAlertEvent {
  final double value;
  const PriceUpdateProductAlertEvent(this.value);
}

class CountUpdateProductAlertEvent extends UpdateProductAlertEvent {
  final int value;
  const CountUpdateProductAlertEvent(this.value);
}


class SubmitUpdateProductAlertEvent extends UpdateProductAlertEvent {}
