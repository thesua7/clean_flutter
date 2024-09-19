
import 'package:clean_flutter/features/jobs/data/data_source/remote/jobs_model_d_t_o_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class JobsRepository{
  Future<Either<Failure, JobsModelDTOEntity>> fetchJobs();

}