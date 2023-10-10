import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite_food_warehouse/core/models/product_model.dart';
import 'package:sqflite_food_warehouse/core/services/database_service.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(
    ProductModel product,
  ) : super(DetailsState(product: product)) {
    on<InitialDetailsEvent>(_initialProductEvent);
    on<UpdateDetailsEvent>(_updateProductEvent);
    on<TitleUpdateDetailsEvent>(_titleUpdateDetailsEvent);
    on<SubmitUpdateProductAlertEvent>(_submitUpdateProductAlertEvent);
  }

  Future<void> _initialProductEvent(InitialDetailsEvent event, Emitter<DetailsState> emit) async {}

  Future<void> _updateProductEvent(UpdateDetailsEvent event, Emitter<DetailsState> emit) async {
    try {
      await DatabaseService.instance.update(
        product: event.updatedProduct,
      );
      final updatedProducts = await DatabaseService.instance.readAllProduct();

      emit(state.copyWith(
        product: event.updatedProduct,
        productList: updatedProducts,
        status: DetailsStatus.success,
      ));
    } catch (error) {
      emit(state.copyWith(status: DetailsStatus.failure));
    }
  }

  Future<void> _titleUpdateDetailsEvent(TitleUpdateDetailsEvent event, Emitter<DetailsState> emit) async {
    emit(state.copyWith(product: state.product.copy(title: event.value)));
  }

  Future<void> _submitUpdateProductAlertEvent(SubmitUpdateProductAlertEvent event, Emitter<DetailsState> emit) async {
    emit(state.copyWith(status: DetailsStatus.loading));
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(status: DetailsStatus.success));
  }
}
