import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../core/shared/response_state.dart';
import '../../../core/shared/shared_preferences_helper.dart';
import '../data/dataSource/remote/user_model_d_t_o_entity.dart';
import 'home_viewModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Fetch user data once when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
      homeViewModel.fetchUser();
    });
    _printToken();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () =>
               Get.offNamed('/jobs'),
            child: Text('GOTO jobs'),
          ),
          Center(
            child: Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                final uiState = viewModel.uiState;

                if (uiState.status == UiStateStatus.loading) {
                  return const CircularProgressIndicator();
                } else if (uiState.status == UiStateStatus.success) {
                  if (uiState.data is UserModelDTOEntity) {
                    final userModel = uiState.data as UserModelDTOEntity;
                    return Text(userModel.toString());
                  } else {
                    return const Text('Unexpected data type');
                  }
                } else if (uiState.status == UiStateStatus.error) {
                  return Text('Error: ${uiState.errorMessage}');
                } else {
                  return const Text('No data available');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _printToken() async {
    final SharedPreferencesHelper sharedPreferencesHelper = Get.find<SharedPreferencesHelper>();
    final token = await sharedPreferencesHelper.getString('token');
    print('Token: $token');
  }

  Future<void> _logout() async {
    final SharedPreferencesHelper sharedPreferencesHelper = Get.find<SharedPreferencesHelper>();
    await sharedPreferencesHelper.remove('token');
    Get.offNamed('/dashboard');
  }
}
