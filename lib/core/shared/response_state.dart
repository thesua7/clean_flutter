enum UiStateStatus { initial, loading, success, error }

class UiState<T> {
  final UiStateStatus status;
  final T? data;
  final String? errorMessage;

  UiState._({required this.status, this.data, this.errorMessage});

  factory UiState.initial() => UiState._(status: UiStateStatus.initial);
  factory UiState.loading() => UiState._(status: UiStateStatus.loading);
  factory UiState.success(T data) => UiState._(status: UiStateStatus.success, data: data);
  factory UiState.error(String errorMessage) => UiState._(status: UiStateStatus.error, errorMessage: errorMessage);
}