import '../../../../core/network/api_service.dart';
import '../models/product_model.dart';

class HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSource(this.apiService);

  Future<List<ProductModel>> getProducts() async {
    final response = await apiService.getProducts();

    return response
        .map(
          (item) => ProductModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}