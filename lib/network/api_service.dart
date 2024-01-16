import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart' ;
import 'package:dio/dio.dart' hide Headers;

import '../model/cat_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @Headers({
    "x-api-key": "live_NEhD4cy2uZ4RYUmclPn1kYbSPOFG3ZWR7ue1idqpD3BuLCGbN8UpmaFoG7kRhyxh"
  })
  @GET("images/search")
  Future<List<CatResponse>> getCats(@Query("med") String size, @Query('page') int page, @Query('limit') int limit);
}
Dio buildDioClient(String baseUrl) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  dio.interceptors.addAll([
    PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90
    )
  ]);
  return dio;
}