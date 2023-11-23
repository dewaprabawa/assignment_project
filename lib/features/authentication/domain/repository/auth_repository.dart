import 'package:assignment_project/core/errors/failures.dart';
import 'package:assignment_project/features/authentication/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> registerUser(String email, String password);

  Future<Either<Failure, UserEntity>> loginUser(String email, String password);
}