import 'package:assignment_project/core/connection/network_info.dart';
import 'package:assignment_project/core/errors/exceptions.dart';
import 'package:assignment_project/core/errors/failures.dart';
import 'package:assignment_project/features/authentication/data/remote/auth_remote_data_source.dart';
import 'package:assignment_project/features/authentication/domain/entity/user_entity.dart';
import 'package:assignment_project/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> registerUser(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final registrationModel = await remoteDataSource.registerUser(email, password);
        final user = UserEntity(id: registrationModel?.id, token: registrationModel?.token);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final loginModel = await remoteDataSource.loginUser(email, password);
        final user = UserEntity(token: loginModel?.token);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
