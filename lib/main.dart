import 'package:clean_flutter/core/shared/shared_preferences_helper.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/send_otp_usecase.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/verify_otp_usecase.dart';
import 'package:clean_flutter/features/dashboard/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'core/di/dependency_injection.dart';
import 'features/dashboard/domain/usecase/fetch_dashboard_usecase.dart';
import 'features/dashboard/domain/usecase/user_usecase.dart';
import 'features/dashboard/presentation/dashboard_view.dart';
import 'features/dashboard/presentation/dashboard_viewmodel.dart';
import 'features/dashboard/presentation/home_viewModel.dart'; // import HomeViewModel

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  final SharedPreferencesHelper sharedPreferencesHelper = Get.find<SharedPreferencesHelper>();
  final token = await sharedPreferencesHelper.getString('token');

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  MyApp({this.token});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardViewModel(
            Get.find<DashboardUseCase>(),
            Get.find<SendOtpUsecase>(),
            Get.find<VerifyOtpUsecase>(),
            Get.find<SharedPreferencesHelper>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(
            Get.find<UserUsecase>(), // Assuming UserUsecase is provided by DependencyInjection
          ),
        ),
      ],
      child: GetMaterialApp(
        initialRoute: token != null && token!.isNotEmpty ? '/home' : '/dashboard',
        getPages: [
          GetPage(name: '/dashboard', page: () => DashboardScreen()),
          GetPage(name: '/home', page: () => HomeView()),
        ],
      ),
    );
  }
}
