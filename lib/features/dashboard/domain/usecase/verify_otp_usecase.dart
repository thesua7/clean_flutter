import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_verify_otp_d_t_o_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repository/dashboard_repository.dart';


class VerifyOtpUsecase implements BaseUseCase<DummyVerifyOtpDTOEntity, Params> {
  final DashboardRepository repository;

  VerifyOtpUsecase(this.repository);

  @override
  Future<Either<Failure, DummyVerifyOtpDTOEntity>> call(Params params) async {
    return await repository.verifyOTP(params.user_id,params.otp);
  }
}

class Params {
  final String user_id;
  final String otp;

  Params({
    required this.user_id,
    required this.otp,
  });
}
