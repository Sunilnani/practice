class ResponseData<T> {
  ResponseData(this.message, this.status, {required this.data});

  final T data;
  final String message;
  final ResponseStatus status;
}

enum ResponseStatus {
  SUCCESS,
  FAILED,
}
