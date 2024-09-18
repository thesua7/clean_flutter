import 'package:clean_flutter/features/dashboard/domain/usecase/send_otp_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'core/di/dependency_injection.dart';
import 'features/dashboard/domain/usecase/fetch_dashboard_usecase.dart';
import 'features/dashboard/presentation/dashboard_view.dart';
import 'features/dashboard/presentation/dashboard_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardViewModel(
             Get.find<DashboardUseCase>(),Get.find<SendOtpUsecase>()
          ), // Assuming FetchDashboardUseCase is provided by DependencyInjection
        ),
      ],
      child: MaterialApp(
        home: DashboardScreen(),
      ),
    );
  }
}
