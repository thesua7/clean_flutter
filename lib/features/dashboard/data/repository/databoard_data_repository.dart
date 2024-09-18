import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_d_t_o_entity.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_get_otp_dto_entity.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../../../core/constants/Constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/repository/dashboard_repository.dart';


class DashboardDataRepository implements DashboardRepository {
  final ApiService _apiService;

  DashboardDataRepository(this._apiService);

  @override
  Future<Either<Failure, DummyDTOEntity>> fetchDashboardData() async {
    try {
      final response = await _apiService.get(Constants.dummyApiUrl);
      final data = DummyDTOEntity.fromJson(jsonDecode(response.body));
      return Right(data);
    } catch (error) {
      if (error is NetworkException) {
        return Left(NetworkFailure(error.message));
      } else {
        return Left(GeneralFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, DummyGetOtpDtoEntity>> sendOTP(String number) async {
    try {
      final response = await _apiService.post("https://karmasangsthan.com.bd/api/app_api/auth/get-otp", body: {'phone':number});
      final data = DummyGetOtpDtoEntity.fromJson(jsonDecode(response.body));
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