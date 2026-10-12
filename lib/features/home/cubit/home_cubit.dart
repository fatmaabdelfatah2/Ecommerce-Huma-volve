import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dummy_data.dart';
import '../../../core/network/api_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ApiService apiService;

  HomeCubit(this.apiService) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());

    try {
      final response = await apiService.getProducts();

      final products = response
          .map(
            (item) => Product.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();

      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}