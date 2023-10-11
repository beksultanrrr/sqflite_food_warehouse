part of 'main_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class InitialProductEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  final ProductModel model;
  const AddProductEvent(this.model);
}

class UpdateProductEvent extends ProductEvent {
  final ProductModel model;
  const UpdateProductEvent(this.model);
}

class DeleteProduct extends ProductEvent {
  final int id;
  const DeleteProduct(this.id);
}

class SearchProductsEvent extends ProductEvent {
  final String query;

  const SearchProductsEvent(this.query);
}

class OrderByDate extends ProductEvent {}

class OrderByPrice extends ProductEvent {}
