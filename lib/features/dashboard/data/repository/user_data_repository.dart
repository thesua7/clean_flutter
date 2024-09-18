import 'dart:convert';

import 'package:clean_flutter/core/errors/failure.dart';
import 'package:clean_flutter/core/network/api_service.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/user_model_d_t_o_entity.dart';
import 'package:clean_flutter/features/dashboard/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_exceptions.dart';

class UserDataRepository implements UserRepository {

  final ApiService _apiService;
  UserDataRepository(this._apiService);

  @override
  Future<Either<Failure, UserModelDTOEntity>> fetchUser() async {
    try {
      final response = await _apiService.get("https://karmasangsthan.com.bd/api/app_api/user");
      final data = UserModelDTOEntity.fromJson(jsonDecode(response.body));
      return Right(data);
    } catch (error) {
      if (error is NetworkException) {
        return Left(NetworkFailure(error.message));
      } else {
        return Left(GeneralFailure(error.toString()));
      }
    }
  }


}