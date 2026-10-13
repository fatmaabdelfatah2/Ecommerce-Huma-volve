import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecases/get_products_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;

  HomeCubit(this.getProductsUseCase) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());

    try {
      final products = await getProductsUseCase();

      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}