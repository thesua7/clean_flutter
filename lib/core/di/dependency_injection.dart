import 'package:clean_flutter/features/dashboard/data/repository/user_data_repository.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/send_otp_usecase.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/user_usecase.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/verify_otp_usecase.dart';
import 'package:clean_flutter/features/dashboard/presentation/home_viewModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/data/repository/databoard_data_repository.dart';
import '../../features/dashboard/domain/usecase/fetch_dashboard_usecase.dart';
import '../../features/dashboard/presentation/dashboard_viewmodel.dart';
import '../network/api_service.dart';
import '../network/interceptors.dart';
import '../network/network_info.dart';
import '../network/timeout_interceptor.dart';
import '../shared/shared_preferences_helper.dart';
import 'package:http/http.dart' as http;

// Dependency Injection setup using GetX
class DependencyInjection {
  static Future<void> init() async {
    // Initialize SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    final sharedPreferencesHelper =
        SharedPreferencesHelper(Future.value(sharedPreferences));

    // Register dependencies
    Get.lazyPut(() => sharedPreferencesHelper);

    // Ensure the http.Client is available before using it
    Get.lazyPut(() => http.Client());

    // Network info and interceptors
    Get.lazyPut(() => NetworkInfo());
    Get.lazyPut(() => TimeoutInterceptor(const Duration(seconds: 20)));
    Get.lazyPut(() => Interceptor(Get.find<SharedPreferencesHelper>()));

    // API Service
    Get.lazyPut(() => ApiService(
          Get.find<http.Client>(),
          Get.find<NetworkInfo>(),
          Get.find<TimeoutInterceptor>(),
          Get.find<Interceptor>(),
        ));

    // Repositories
    Get.lazyPut(() => DashboardDataRepository(Get.find<ApiService>()));
    Get.lazyPut(() => UserDataRepository(Get.find<ApiService>()));

    // Use Cases
    Get.lazyPut(() => DashboardUseCase(Get.find<DashboardDataRepository>()));
    Get.lazyPut(() => SendOtpUsecase(Get.find<DashboardDataRepository>()));
    Get.lazyPut(() => VerifyOtpUsecase(Get.find<DashboardDataRepository>()));

    Get.lazyPut(() => UserUsecase(Get.find<UserDataRepository>()));

    // ViewModels
    Get.lazyPut(() => DashboardViewModel(
        Get.find<DashboardUseCase>(),
        Get.find<SendOtpUsecase>(),
        Get.find<VerifyOtpUsecase>(),
        Get.find<SharedPreferencesHelper>()));

    Get.lazyPut(() => HomeViewModel(
        Get.find<UserUsecase>()));
  }


}
