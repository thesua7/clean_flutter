import 'package:clean_flutter/core/usecase/base_usecase.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/send_otp_usecase.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/verify_otp_usecase.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/response_state.dart';
import '../../../core/shared/shared_preferences_helper.dart';
import '../../../core/viewModel/base_viewmodel.dart';
import '../data/dataSource/remote/dummy_verify_otp_d_t_o_entity.dart';
import '../domain/usecase/fetch_dashboard_usecase.dart';

class DashboardViewModel extends BaseViewModel {
  final DashboardUseCase _useCase;
  final SendOtpUsecase _sendOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  DashboardViewModel(this._useCase, this._sendOtpUsecase,
      this._verifyOtpUsecase, this._sharedPreferencesHelper);

  Future<void> fetchDashboardData() async {
    await performAction(() async {
      return await _useCase.call(NoParams());
    });
  }

  Future<void> sendOTP(String phoneNumber) async {
    final params = SendOTPParams(phoneNumber: phoneNumber);
    await performAction(() async {
      return await _sendOtpUsecase.call(params);
    });
  }

  Future<void> verifyOTP(String userId, String otp) async {
    final params = Params(user_id: userId, otp: otp);
    await performAction(() async {
      final result = await _verifyOtpUsecase.call(params);
      result.fold(
        (failure) => setUiState(UiState.error(failure.toString())),
        (verifyOtpData) async {
          await _sharedPreferencesHelper.setString(
              'token', verifyOtpData.token ?? ''); // Save auth token
          setUiState(UiState.success(verifyOtpData));

          final token =await _sharedPreferencesHelper.getString('token');

          print(token);
        },
      );

      return result;
    });
  }
}
