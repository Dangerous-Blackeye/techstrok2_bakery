// import 'package:dio/dio.dart';
// import 'package:techstrock2/demoApi/productmodal.dart';

// class FakeStoreApiClient {
//   final _dio = Dio(BaseOptions(
//     baseUrl: 'https://fakestoreapi.com',
//   ));

//   Future<List<Product>> getProducts() async {
//     try {
//       final response = await _dio.get('/products');
//       final List<dynamic> data = response.data;
//       return data.map((json) => Product.fromJson(json)).toList();
//     } catch (e) {
//       throw Exception('Failed to get products: $e');
//     }
//   }
// }
