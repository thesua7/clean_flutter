import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/dataSource/remote/dummy_get_otp_dto_entity.dart';
import '../repository/dashboard_repository.dart';


class SendOtpUsecase implements BaseUseCase<DummyGetOtpDtoEntity, SendOTPParams> {
  final DashboardRepository repository;

  SendOtpUsecase(this.repository);

  @override
  Future<Either<Failure, DummyGetOtpDtoEntity>> call(SendOTPParams params) async {
    return await repository.sendOTP(params.phoneNumber);
  }
}

class SendOTPParams {
  final String phoneNumber;
  final String otpType;

  SendOTPParams({
    required this.phoneNumber,
    required this.otpType,
  });
}
