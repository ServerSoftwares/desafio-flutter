import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';

import '../../constants/constants_url_api.dart';
import '../../data/mapper/model_to_remote.dart';
import '../../data/mapper/remote_to_model.dart';
import '../../data/remote/data_source/astro_remote_data_source.dart';
import '../../data/remote/model/response/body/details_data/body_details_data_response.dart';
import '../../data/remote/model/response/body/list_data/body_list_data_response.dart';
import '../../data/remote/model/response/image_url/data/image_data_response.dart';
import '../../domain/exception/authentication_exception.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/body/body_details_data_model.dart';
import '../../domain/model/body/body_list_data_model.dart';
import '../../domain/model/body/body_model.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/moon_phase/moon_phase_model.dart';
import '../../domain/model/star_chart/star_chart_model.dart';

class AstroRemoteDataSourceImpl implements AstroRemoteDataSource {
  AstroRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;
  final String encodedHash = base64Encode(utf8.encode(ConstantsUrlApi.hash));

  @override
  Future<BodyDetailsDataModel> getBodyDetailsDataModel(
      BodyModel bodyModel, String bodyId) async {
    _dio.options.headers['authorization'] = 'Basic $encodedHash';
    final bodyRequest = bodyModel.toBodyRequest();
    try {
      final response = await _dio.get(
          '${ConstantsUrlApi.bodyBaseUrl}/positions/$bodyId',
          queryParameters: {
            'latitude': bodyRequest.latitude,
            'longitude': bodyRequest.longitude,
            'fromDate': bodyRequest.fromDate,
            'toDate': bodyRequest.toDate,
            'time': bodyRequest.time
          });
      final bodyDetailsData = BodyDetailsDataResponse.fromJson(response.data);
      return bodyDetailsData.toBodyDetailsDataModel();
    } on DioError catch (dioError, _) {
      throw _getException(dioError);
    }
  }

  @override
  Future<BodyListDataModel> getBodyList() async {
    _dio.options.headers['authorization'] = 'Basic $encodedHash';
    try {
      final response = await _dio.get(ConstantsUrlApi.bodyBaseUrl);
      final bodyListDataResponse = BodyListDataResponse.fromJson(response.data);
      return bodyListDataResponse.toBodyListDataModel();
    } on DioError catch (dioError, _) {
      throw _getException(dioError);
    }
  }

  @override
  Future<ImageDataModel> getStarChartImage(
      StarChartModel starChartModel) async {
    _dio.options.headers['authorization'] = 'Basic $encodedHash';
    try {
      final response = await _dio.post(ConstantsUrlApi.starChartBaseUrl,
          data: starChartModel.toStarChartRequest());
      final imageDataResponse = ImageDataResponse.fromJson(response.data);
      return imageDataResponse.toImageDataModel();
    } on DioError catch (dioError, _) {
      throw _getException(dioError);
    }
  }

  @override
  Future<ImageDataModel> getMoonPhaseImage(
      MoonPhaseModel moonPhaseModel) async {
    _dio.options.headers['authorization'] = 'Basic $encodedHash';
    try {
      final response = await _dio.post(ConstantsUrlApi.moonPhaseBaseUrl,
          data: moonPhaseModel.toMoonPhaseRequest());
      final imageDataResponse = ImageDataResponse.fromJson(response.data);
      return imageDataResponse.toImageDataModel();
    } on DioError catch (dioError, _) {
      throw _getException(dioError);
    }
  }
}

Exception _getException(DioError dioError) {
  if (dioError.type == DioErrorType.response) {
    if (dioError.response?.statusCode == HttpStatus.forbidden) {
      return AuthenticationException();
    }
    return GenericErrorStatusCodeException();
  }
  return NetworkErrorException();
}
