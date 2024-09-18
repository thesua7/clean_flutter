import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/shared/response_state.dart';
import '../data/dataSource/remote/dummy_d_t_o_entity.dart';
import 'dashboard_viewmodel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // Fetch the ViewModel using Provider
    final viewModel = Provider.of<DashboardViewModel>(context);
    final TextEditingController inputBox = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blueAccent,
            child: Center(
              child: Consumer<DashboardViewModel>(
                builder: (context, viewModel, child) {
                  final uiState = viewModel.uiState;

                  if (uiState.status == UiStateStatus.loading) {
                    return const CircularProgressIndicator();
                  } else if (uiState.status == UiStateStatus.success) {
                    return Text('Data: ${(uiState.data as DummyDTOEntity).title}');
                  } else if (uiState.status == UiStateStatus.error) {
                    return Text('Error: ${uiState.errorMessage}');
                  } else {
                    return const Text('Welcome to Dashboard!');
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
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final text = inputBox.text;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Entered text: $text')),
              );
            },
            child: Text('Show Text'),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchDashboardData(),
        child: const Icon(Icons.read_more),
      ),
    );
  }
}
