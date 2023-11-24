import 'dart:io';

import 'package:assignment_project/core/connection/network_info.dart';
import 'package:assignment_project/core/preference/token_manager.dart';
import 'package:assignment_project/features/authentication/data/remote/auth_remote_data_source.dart';
import 'package:assignment_project/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:assignment_project/features/authentication/domain/repository/auth_repository.dart';
import 'package:assignment_project/features/authentication/domain/usecase/auth_usecase.dart';
import 'package:assignment_project/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final service = GetIt.instance;

class ServiceLocator {
  static Future<void> take() async {
    service.registerLazySingleton(() => http.Client());
    service.registerLazySingleton(() => TokenManager());
    service.registerLazySingleton(() => Connectivity());
    service.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(service()));
    
    service.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: service()));

    service.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: service(), networkInfo: service()));

    service.registerLazySingleton(() => AuthUseCase(service()));
    

    service.registerFactory(() => AuthCubit(service(), service()));
  }
}