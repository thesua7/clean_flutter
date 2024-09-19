import 'package:clean_flutter/core/viewModel/base_viewmodel.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/user_usecase.dart';
import 'package:clean_flutter/features/jobs/domain/usecase/get_jobs_usecase.dart';

import '../../../core/usecase/base_usecase.dart';

class Jobsviewmodel extends BaseViewModel{

  final GetJobsUsecase  _userUsecase;

  Jobsviewmodel(this._userUsecase);

  Future<void> fetchJobs() async {
    await performAction(() async {
      return await _userUsecase.call(NoParams());
    });
  }

}