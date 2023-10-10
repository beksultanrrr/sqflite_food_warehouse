import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite_food_warehouse/core/services/database_service.dart';

part 'statistics_events.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(const StatisticsState()) {
    on<InitialStatisticsEvent>(_initialStatisticsEvent);
  }

  //* InitialStatisticsEvent
  Future<void> _initialStatisticsEvent(InitialStatisticsEvent event, Emitter<StatisticsState> emit) async {
    final price = await DatabaseService.instance.getPrice();
     final count = await DatabaseService.instance.getCount();
    

    emit(state.copyWith(countProduct: count, priceProduct: price, status: StatisticsStatus.initial));
    print("zxszxzxzxzx $count");
  }

  // Future<void> _deleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
  //   await DatabaseService.instance.delete(id: event.id);

  //   emit(state.copyWith(products: List.of(state.products)..removeWhere((e) => e.id == event.id)));
  // }
}
