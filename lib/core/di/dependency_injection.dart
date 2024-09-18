import 'package:clean_flutter/features/dashboard/domain/usecase/send_otp_usecase.dart';
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
    final sharedPreferencesHelper = SharedPreferencesHelper(Future.value(sharedPreferences));

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

    // Use Cases
    Get.lazyPut(() => DashboardUseCase(Get.find<DashboardDataRepository>()));
    Get.lazyPut(() => SendOtpUsecase(Get.find<DashboardDataRepository>()));

    // ViewModels
    Get.lazyPut(() => DashboardViewModel(Get.find<DashboardUseCase>(),Get.find<SendOtpUsecase>()));
  }
}
