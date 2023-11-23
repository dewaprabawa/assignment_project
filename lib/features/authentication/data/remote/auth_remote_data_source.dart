import 'dart:convert';

import 'package:assignment_project/core/errors/exceptions.dart';
import 'package:assignment_project/features/authentication/data/model/login_model.dart';
import 'package:assignment_project/features/authentication/data/model/register_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<RegistrationModel?> registerUser(String email, String password);

  Future<LoginModel?> loginUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<RegistrationModel?> registerUser(String email, String password) =>
      _authUser('https://reqres.in/api/register', email, password);

  @override
  Future<LoginModel?> loginUser(String email, String password) =>
      _authUser('https://reqres.in/api/login', email, password);

  Future<T> _authUser<T>(
    String url,
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        if (url.contains('register')) {
          return RegistrationModel.fromJson(response.data) as T;
        } else if (url.contains('login')) {
          return LoginModel.fromJson(response.data) as T;
        }
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
