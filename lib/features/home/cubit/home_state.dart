import '../domain/entities/product_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductEntity> products;

  HomeSuccess(this.products);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}