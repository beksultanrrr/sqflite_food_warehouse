part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class InitialDetailsEvent extends DetailsEvent {}

class UpdateDetailsEvent extends DetailsEvent {
  final ProductModel updatedProduct;

  const UpdateDetailsEvent(this.updatedProduct);
}

class TitleUpdateDetailsEvent extends DetailsEvent {
  final String value;
  const TitleUpdateDetailsEvent(this.value);
}

class SubmitUpdateProductAlertEvent extends DetailsEvent {}
