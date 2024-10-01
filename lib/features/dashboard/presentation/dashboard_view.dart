import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../../../core/shared/response_state.dart';
import '../data/dataSource/remote/dummy_d_t_o_entity.dart';
import '../data/dataSource/remote/dummy_get_otp_dto_entity.dart';
import '../data/dataSource/remote/dummy_verify_otp_d_t_o_entity.dart';
import 'dashboard_viewmodel.dart';
import '../../../core/theme/theme_provider.dart'; // Import the ThemeProvider

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DashboardViewModel>(context, listen: false);
    final TextEditingController inputBox = TextEditingController();
    final TextEditingController inputBoxVerify = TextEditingController();
    int uid = -1;

    final Color primaryColor = Theme.of(context).colorScheme.primary; // Get primary color from theme
    final Color surfaceColor = Theme.of(context).colorScheme.surface; // Get surface color from theme
    final Color errorColor = Colors.red; // Define error color directly


    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // Toggle theme when the button is pressed
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: surfaceColor, // Use surface color for the container
            child: Center(
              child: Consumer<DashboardViewModel>(
                builder: (context, viewModel, child) {
                  final uiState = viewModel.uiState;

                  if (uiState.status == UiStateStatus.loading) {
                    return const CircularProgressIndicator();
                  } else if (uiState.status == UiStateStatus.success) {
                    if (uiState.data is DummyDTOEntity) {
                      final data = uiState.data as DummyDTOEntity;
                      return Text('Data: ${data.title}', style: TextStyle(color: Colors.white));
                    } else if (uiState.data is DummyGetOtpDtoEntity) {
                      final otpData = uiState.data as DummyGetOtpDtoEntity;
                      uid = otpData.data!.id!;
                      return Text('OTP Data: ${otpData.toString()}', style: TextStyle(color: Colors.white));
                    } else if (uiState.data is DummyVerifyOtpDTOEntity) {
                      final verifyOtp = uiState.data as DummyVerifyOtpDTOEntity;
                      return Text('OTP Data: ${verifyOtp.toString()}', style: TextStyle(color: Colors.white));
                    } else {
                      return const Text('Unknown data type', style: TextStyle(color: Colors.white));
                    }
                  } else if (uiState.status == UiStateStatus.error) {
                    return Text('Error: ${uiState.errorMessage}', style: TextStyle(color: errorColor));
                  } else {
                    return const Text('Welcome to Dashboard!', style: TextStyle(color: Colors.white));
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: inputBox,
            decoration: InputDecoration(
              labelText: 'Enter text',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor), // Use primary color for focused border
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => viewModel.sendOTP(inputBox.text),
            child: const Text('Send OTP'),
          ),
          TextField(
            controller: inputBoxVerify,
            decoration: InputDecoration(
              labelText: 'Verify OTP',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor), // Use primary color for focused border
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _verifyOTP(uid.toString(), inputBoxVerify.text, viewModel),
            child: const Text('Verify OTP'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchDashboardData(),
        backgroundColor: primaryColor, // Use primary color for FAB
        child: const Icon(Icons.read_more),
      ),
    );
  }

  void _verifyOTP(String uid, String otp, DashboardViewModel viewModel) {
    viewModel.verifyOTP(uid, otp).then((result) {
      final uiState = viewModel.uiState;

      final verifyOtp = uiState.data as DummyVerifyOtpDTOEntity;

      if (verifyOtp.message == "successfully logged in") {
        // Navigate to the logout page
        Get.offAllNamed('/home');
      } else {
        throw verifyOtp.message!;
      }
    }).catchError((error) {
      print('Error verifying OTP: $error');
    });
  }
}
