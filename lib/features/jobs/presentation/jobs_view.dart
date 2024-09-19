import 'package:clean_flutter/features/jobs/data/data_source/remote/jobs_model_d_t_o_entity.dart';
import 'package:clean_flutter/features/jobs/presentation/JobsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/shared/response_state.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch jobs when the widget is built for the first time
    final homeViewModel = Provider.of<Jobsviewmodel>(context, listen: false);
    homeViewModel.fetchJobs();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "data",
              style: TextStyle(fontSize: 18.sp),
            ),
            Center(
              child: Consumer<Jobsviewmodel>(
                builder: (context, viewModel, child) {
                  final uiState = viewModel.uiState;
        
                  if (uiState.status == UiStateStatus.loading) {
                    return const CircularProgressIndicator();
                  } else if (uiState.status == UiStateStatus.success) {
                    if (uiState.data is JobsModelDTOEntity) {
                      final userModel = uiState.data as JobsModelDTOEntity;
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
            Container(
              height: 38.h,
              width: 38.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
              ),
            )
          ],
        ),
      ),
    );
  }
}
