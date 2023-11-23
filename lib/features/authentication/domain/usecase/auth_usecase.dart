import 'package:assignment_project/core/errors/failures.dart';
import 'package:assignment_project/features/authentication/domain/entity/user_entity.dart';
import 'package:assignment_project/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> registerUser(String email, String password) async {
    return await repository.registerUser(email, password);
  }

  Future<Either<Failure, UserEntity>> loginUser(String email, String password) async {
    return await repository.loginUser(email, password);
  }
}
