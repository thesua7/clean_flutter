import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../errors/failure.dart';
import '../shared/response_state.dart';

abstract class BaseViewModel extends ChangeNotifier {
  UiState _uiState = UiState.initial();
  UiState get uiState => _uiState;

  void setUiState(UiState state) {
    _uiState = state;
    notifyListeners();
  }

  Future<void> performAction<T>(Future<Either<Failure, T>> Function() action) async {
    setUiState(UiState.loading());
    final result = await action();
    result.fold(
          (failure) => setUiState(UiState.error(failure.toString())), // Error handling is managed in the ViewModel
          (data) => setUiState(UiState.success(data)),
    );
  }
}
