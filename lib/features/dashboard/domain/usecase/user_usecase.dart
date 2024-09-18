import 'package:clean_flutter/features/dashboard/data/dataSource/remote/user_model_d_t_o_entity.dart';
import 'package:clean_flutter/features/dashboard/data/repository/user_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_usecase.dart';

class UserUsecase implements BaseUseCase<UserModelDTOEntity, NoParams> {
  final UserDataRepository _repository;

  UserUsecase(this._repository);

  @override
  Future<Either<Failure, UserModelDTOEntity>> call(NoParams params) async {
    return await _repository.fetchUser();
  }
}
