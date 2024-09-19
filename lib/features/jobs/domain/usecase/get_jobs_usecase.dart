import 'package:clean_flutter/features/jobs/data/data_source/remote/jobs_model_d_t_o_entity.dart';
import 'package:clean_flutter/features/jobs/domain/repository/jobs_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/base_usecase.dart';

import '../../../../core/errors/failure.dart';

class GetJobsUsecase implements BaseUseCase<JobsModelDTOEntity, NoParams> {
  final JobsRepository _repository;

  GetJobsUsecase(this._repository);

  @override
  Future<Either<Failure, JobsModelDTOEntity>> call(NoParams params) async {
    return await _repository.fetchJobs();
  }
}
