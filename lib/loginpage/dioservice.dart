// import 'package:dio/dio.dart';

// class LoginService {
//   final Dio dio = Dio();

//   Future<String?> loginUser(String email, String password) async {
//     try {
//       final response = await dio.post(
//         'https://staging.greatwisher.com/harshad_backup/api/login',
//         data: {
//           'email': email,
//           'password': password,
//         },
//       );
//       return response.data['token'];
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
