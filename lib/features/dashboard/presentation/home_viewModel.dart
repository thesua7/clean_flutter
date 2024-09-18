import 'package:clean_flutter/core/viewModel/base_viewmodel.dart';
import 'package:clean_flutter/features/dashboard/domain/usecase/user_usecase.dart';

import '../../../core/usecase/base_usecase.dart';

class HomeViewModel extends BaseViewModel{

  final UserUsecase  _userUsecase;

  HomeViewModel(this._userUsecase);

  Future<void> fetchUser() async {
    await performAction(() async {
      return await _userUsecase.call(NoParams());
    });
  }

}