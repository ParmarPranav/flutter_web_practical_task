import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(T data) : super(data: data);
}

class DataDioException<T> extends DataState<T> {
  const DataDioException(DioException error) : super(exception: error);
}
