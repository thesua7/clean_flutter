import 'dart:convert';

import 'package:clean_flutter/core/errors/failure.dart';
import 'package:clean_flutter/features/jobs/data/data_source/remote/jobs_model_d_t_o_entity.dart';
import 'package:clean_flutter/features/jobs/domain/repository/jobs_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api_service.dart';
import '../../../../core/network/network_exceptions.dart';

class JobsDataRepository implements JobsRepository{

  final ApiService _apiService;

  JobsDataRepository(this._apiService);


  @override
  Future<Either<Failure, JobsModelDTOEntity>> fetchJobs() async {
    try {
      final response = await _apiService.get("https://karmasangsthan.com.bd/api/app_api/jobs");
      final data = JobsModelDTOEntity.fromJson(jsonDecode(response.body));
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