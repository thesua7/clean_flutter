import 'package:clean_flutter/core/usecase/base_usecase.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/send_otp_usecase.dart';
import 'package:flutter/material.dart';

import '../../../core/viewModel/base_viewmodel.dart';
import '../domain/usecase/fetch_dashboard_usecase.dart';


class DashboardViewModel extends BaseViewModel {
  final DashboardUseCase _useCase;
  final SendOtpUsecase _sendOtpUsecase;

  DashboardViewModel(this._useCase,this._sendOtpUsecase);

  Future<void> fetchDashboardData() async {
    await performAction(() async {
      return await _useCase.call(NoParams());
    });
  }
}
