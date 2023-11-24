import 'dart:convert';
import 'package:assignment_project/core/errors/exceptions.dart';
import 'package:assignment_project/features/authentication/data/model/login_model.dart';
import 'package:assignment_project/features/authentication/data/model/register_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<RegistrationModel?> registerUser(String email, String password);

  Future<LoginModel?> loginUser(String email, String password);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

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
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      
      if (response.statusCode == 200) {
        if (url.contains('register')) {
          return RegistrationModel.fromJson(json.decode(response.body)) as T;
        } else if (url.contains('login')) {
          return LoginModel.fromJson(json.decode(response.body)) as T;
        }
      } else if (response.statusCode == 400) {
            print(response.body);
        // Handle specific error for status code 400
        final errorData = json.decode(response.body);
        throw ServerException(message: errorData['error'] ?? 'Unknown error');
      }

      throw ServerException(message: 'Unknown error');
    } catch (e) {
      print(e);
      throw ServerException(message: e.toString());
    }
  }
}
