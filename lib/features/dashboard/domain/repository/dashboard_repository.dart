import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_d_t_o_entity.dart';
import 'package:clean_flutter/features/dashboard/data/dataSource/remote/dummy_get_otp_dto_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';


abstract class DashboardRepository {
  Future<Either<Failure, DummyDTOEntity>> fetchDashboardData();
  Future<Either<Failure,DummyGetOtpDtoEntity>> sendOTP(String number);
}
