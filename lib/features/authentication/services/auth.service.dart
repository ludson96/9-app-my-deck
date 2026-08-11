import 'package:dio/dio.dart';

import '../../../shared/errors/custom_error.model.dart';
import '../dtos/auth.dto.dart';

class AuthService {
  late final Dio _dio;

  AuthService(Dio dio)
    : _dio = dio; // Injeção de dependencia (Injection dependecy)

  Future<bool> createAccount(AuthDto auth) async {
    try {
      await _dio.post('/register', data: auth.toMap());

      return true;
    } on DioException catch (e) {
      throw CustomError(_extractErrorMessage(e));
    }
  }

  Future<String> login(AuthDto auth) async {
    try {
      final result = await _dio.post('/login', data: auth.toMap());

      return result.data;
    } on DioException catch (e) {
      throw CustomError(_extractErrorMessage(e));
    }
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data.containsKey('error')) {
      return data['error'].toString();
    } else if (data is List && data.isNotEmpty) {
      return data.first.toString();
    } else if (data is String && data.isNotEmpty) {
      return data;
    }
    return e.message ?? 'Ocorreu um erro na requisição';
  }
}
