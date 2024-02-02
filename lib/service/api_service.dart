import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' ;

import 'api_endpoint.dart';
class APIRequestParam {
  final String path;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final Options? options;
  APIRequestParam({
    required this.path,
    this.data,
    this.queryParameters,
    this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'data': data,
      'queryParameters': queryParameters,
    };
  }

  factory APIRequestParam.fromMap(Map<String, dynamic> map) {
    return APIRequestParam(
      path: map['path'] as String,
      data: map['data'] as dynamic,
      queryParameters: map['queryParameters'] != null
          ? Map<String, dynamic>.from(
          (map['queryParameters'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory APIRequestParam.fromJson(String source) =>
      APIRequestParam.fromMap(json.decode(source) as Map<String, dynamic>);

  APIRequestParam copyWith({
    String? path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return APIRequestParam(
      path: path ?? this.path,
      data: data ?? this.data,
      queryParameters: queryParameters ?? this.queryParameters,
      options: options ?? this.options,
    );
  }
}
abstract class ApiProvider {
  Future<Either<DioException, Response>> get(APIRequestParam param);
  Future<Either<DioException, Response>> post(APIRequestParam param);
  Future<Either<DioException, Response>> put(APIRequestParam param);
  Future<Either<DioException, Response>> patch(APIRequestParam param);
  Future<Either<DioException, Response>> delete(APIRequestParam param);
}
class AppApiProvider implements ApiProvider {
  static AppApiProvider? _instance;
  // Avoid self instance
  AppApiProvider._();
  static AppApiProvider get instance {
    _instance ??= AppApiProvider._();
    return _instance!;
  }

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.apiEndpoint,
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 50000),
    ),
  );

  @override
  Future<Either<DioException, Response>> delete(APIRequestParam param) async {
    return await Task(() => dio.delete(param.path,
        queryParameters: param.queryParameters,
        options: param.options)).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> get(APIRequestParam param) async {
    return await Task(() => dio.get(param.path,
        queryParameters: param.queryParameters,
        options: param.options)).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> patch(APIRequestParam param) async {
    return await Task(() => dio.patch(param.path,
        data: param.data,
        queryParameters: param.queryParameters,
        options: param.options)).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> post(APIRequestParam param) async {
    return await Task(() => dio.post(param.path,
        data: param.data,
        queryParameters: param.queryParameters,
        options: param.options)).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> put(APIRequestParam param) async {
    return await Task(() => dio.put(param.path,
        queryParameters: param.queryParameters,
        options: param.options)).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }
}
