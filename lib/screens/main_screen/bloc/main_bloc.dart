import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sqflite_food_warehouse/core/services/database_service.dart';

import '../../../core/models/product_model.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainScreenBloc extends Bloc<ProductEvent, ProductState> {
  MainScreenBloc() : super(const ProductState()) {
    on<InitialProductEvent>(_initialMainScreenEvent);
    on<AddProductEvent>(_addProductEvent);
    on<DeleteProduct>(_deleteProduct);
    on<SearchProductsEvent>(_searchProductsEvent);
    on<OrderByDate>(_orderByDate);
    on<OrderByPrice>(_orderByPrice);
    on<UpdateProductEvent>(_updateProductEvent);
  }

  Future<void> _initialMainScreenEvent(InitialProductEvent event, Emitter<ProductState> emit) async {
    try {
      final List<ProductModel> products = await DatabaseService.instance.readAllProduct();
      emit(state.copyWith(products: products, status: ProductStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> _addProductEvent(AddProductEvent event, Emitter<ProductState> emit) async {
    try {
      await DatabaseService.instance.create(event.model);
      final List<ProductModel> newProduct = await DatabaseService.instance.readAllProduct();
      emit(state.copyWith(products: newProduct, status: ProductStatus.success));
    } catch (error) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> _updateProductEvent(UpdateProductEvent event, Emitter<ProductState> emit) async {
    await DatabaseService.instance.update(product: event.model);
    final List<ProductModel> newProduct = await DatabaseService.instance.readAllProduct();
    emit(state.copyWith(products: newProduct, status: ProductStatus.success));
  }

  Future<void> _deleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
    await DatabaseService.instance.delete(id: event.id);

    emit(state.copyWith(products: List.of(state.products)..removeWhere((e) => e.id == event.id)));
  }

  Future<void> _searchProductsEvent(SearchProductsEvent event, Emitter<ProductState> emit) async {
    try {
      final List<ProductModel> allProducts = await DatabaseService.instance.readAllProduct();
      // final List<ProductModel> allProducts = state.products;
      final query = event.query.toLowerCase();
      final List<ProductModel> searchedProducts = query.isEmpty ? List.of(allProducts) : state.products.where((product) => product.title.toLowerCase().contains(query)).toList();

      print(searchedProducts.isNotEmpty);
      emit(state.copyWith(products: searchedProducts));
      print(searchedProducts.length);

      // emit(state.copyWith(
      //     products: searchedProducts, status: ProductStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> _orderByDate(OrderByDate event, Emitter<ProductState> emit) async {
    emit(state.copyWith(products: List.of(state.products).reversed.toList()));
  }

  Future<void> _orderByPrice(OrderByPrice event, Emitter<ProductState> emit) async {
    // Создайте копию списка продуктов и отсортируйте его по цене
    final sortedProducts = List.of(state.products)..sort((a, b) => a.price.compareTo(b.price));

    // Обновите состояние с отсортированным списком
    emit(state.copyWith(products: sortedProducts));
  }
}
