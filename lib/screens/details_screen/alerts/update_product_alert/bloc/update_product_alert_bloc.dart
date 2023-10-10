import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite_food_warehouse/core/models/product_model.dart';

part 'update_product_alert_events.dart';
part 'update_product_alert_state.dart';

class UpdateProductAlertBloc extends Bloc<UpdateProductAlertEvent, UpdateProductAlertState> {
  UpdateProductAlertBloc(ProductModel product) : super(UpdateProductAlertState(product: product)) {
    on<InitialUpdateProductAlertEvent>(_initialUpdateProductAlertEvent);
    on<TitleUpdateProductAlertEvent>(_titleUpdateProductAlertEvent);
    on<DescriptionUpdateProductAlertEvent>(_descriptionUpdateProductAlertEvent);
    on<ImgUrlUpdateProductAlertEvent>(_imgUrlUpdateProductAlertEvent);
    on<CountUpdateProductAlertEvent>(_countUpdateProductAlertEvent);
    on<PriceUpdateProductAlertEvent>(_priceUpdateProductAlertEvent);
    on<SubmitUpdateProductAlertEvent>(_submitUpdateProductAlertEvent);
  }

  //* InitialUpdateProductAlertEvent
  Future<void> _initialUpdateProductAlertEvent(InitialUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {}
  //* TitleUpdateProductAlertEvent
  Future<void> _titleUpdateProductAlertEvent(TitleUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {
    emit(state.copyWith(product: state.product.copy(title: event.value)));
  }

  //* DescriptionUpdateProductAlertEvent
  Future<void> _descriptionUpdateProductAlertEvent(DescriptionUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {
    emit(state.copyWith(product: state.product.copy(description: event.value)));
  }

  Future<void> _imgUrlUpdateProductAlertEvent(ImgUrlUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {
    emit(state.copyWith(product: state.product.copy(imagePath: event.value)));
  }

  Future<void> _priceUpdateProductAlertEvent(PriceUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {
    emit(state.copyWith(product: state.product.copy(price: event.value)));
  }

  Future<void> _countUpdateProductAlertEvent(CountUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {
    emit(state.copyWith(product: state.product.copy(count: event.value)));
  }



  //* SubmitUpdateProductAlertEvent
  Future<void> _submitUpdateProductAlertEvent(SubmitUpdateProductAlertEvent event, Emitter<UpdateProductAlertState> emit) async {
    emit(state.copyWith(status: UpdateProductAlertStatus.loading));
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(status: UpdateProductAlertStatus.success));
  }
}
