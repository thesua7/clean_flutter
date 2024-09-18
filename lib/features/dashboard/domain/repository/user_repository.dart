import 'package:clean_flutter/features/dashboard/data/dataSource/remote/user_model_d_t_o_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModelDTOEntity>> fetchUser();

}