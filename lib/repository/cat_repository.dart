import 'package:cat_app/model/cat_response.dart';
import 'package:cat_app/network/api_service.dart';

abstract class CatRepository {
  Future<List<CatResponse>> getCats();
}

class CatRepoImpl extends CatRepository {
  final _api = ApiService(buildDioClient("https://api.thecatapi.com/v1/"));
  @override
  Future<List<CatResponse>> getCats() async {
    return await _api.getCats("med", 1, 50);
  }
}