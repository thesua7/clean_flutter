import 'package:dartz/dartz.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/dataSource/remote/dummy_d_t_o_entity.dart';
import '../repository/dashboard_repository.dart';
import '../../../../core/errors/failure.dart';

class DashboardUseCase implements BaseUseCase<DummyDTOEntity, NoParams> {
  final DashboardRepository _repository;

  DashboardUseCase(this._repository);

  @override
  Future<Either<Failure, DummyDTOEntity>> call(NoParams params) async {
    return await _repository.fetchDashboardData();
  }
}
