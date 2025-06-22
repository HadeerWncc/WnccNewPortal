import 'package:dio/dio.dart';

abstract class Failure {
  final String msg;

  Failure({required this.msg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(msg: 'Connection time out with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(msg: 'Send time out with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(msg: 'Receive time out with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(msg: 'badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(msg: 'Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(msg: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(msg: 'Opps there was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(msg: 'Your request was not found, Please try later');
    } else if (statusCode == 500) {
      return ServerFailure(msg: response['message']);
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          msg: response['message'] ?? 'there was an error, please try again');
    } else {
      return ServerFailure(msg: 'there was an error, please try again');
    }
  }
}

class CachFailure extends Failure {
  CachFailure({required super.msg});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.msg});
}
